param(
  [Parameter(Mandatory=$true)][string]$Source,
  [Parameter(Mandatory=$true)][string]$Out
)
# Dependency-free Markdown -> .docx (OOXML) converter (Windows fallback for md_to_docx.py).
# House formatting standard (see memory: docx-export-convention):
#   1. Body font size = 12pt (24 half-points), via document defaults.
#   2. Pure black (#000000) font throughout.
#   3. 1.15 line spacing (w:line=276, lineRule=auto) on every paragraph.
#   4. Real Word list formatting (numbering.xml): proper bullet glyphs and auto-numbering,
#      never a literal "-" or hand-written "1." marker.
# Handles: ATX headings, paragraphs, **bold**/*italic*/`code`, bullet & numbered lists
# (incl. nesting), pipe tables, fenced code / ```mermaid (monospace), blockquotes, and
# ![alt](relpath) images resolved relative to the source .md.
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$ErrorActionPreference = 'Stop'
$srcDir = Split-Path -Parent (Resolve-Path $Source)
$md = Get-Content -LiteralPath $Source -Encoding UTF8
$EMU = 914400
$maxImgWidthIn = 6.0
$LINE = 'w:line="276" w:lineRule="auto"'   # 1.15 spacing

$images = @()
$imgCounter = 0
$script:nextNumId = 2          # numId 1 = bullets; 2.. = one per numbered list (restart)
$script:numberedNumIds = @()
$script:activeNumId = $null    # current running numbered list

function Esc([string]$s){
  if ($null -eq $s) { return "" }
  $s = $s -replace '&','&amp;'
  $s = $s -replace '<','&lt;'
  $s = $s -replace '>','&gt;'
  $s = $s -replace '"','&quot;'
  return $s
}

function Inline([string]$text){
  $sb = New-Object System.Text.StringBuilder
  $parts = [System.Text.RegularExpressions.Regex]::Split($text, '(`[^`]*`)')
  foreach($p in $parts){
    if ($p -eq '') { continue }
    if ($p.StartsWith('`') -and $p.EndsWith('`') -and $p.Length -ge 2){
      $code = $p.Substring(1,$p.Length-2)
      [void]$sb.Append('<w:r><w:rPr><w:rFonts w:ascii="Consolas" w:hAnsi="Consolas"/><w:sz w:val="20"/><w:shd w:val="clear" w:fill="EFEFEF"/></w:rPr><w:t xml:space="preserve">'+(Esc $code)+'</w:t></w:r>')
    } else {
      $bparts = [System.Text.RegularExpressions.Regex]::Split($p, '(\*\*[^*]+\*\*)')
      foreach($bp in $bparts){
        if ($bp -eq '') { continue }
        if ($bp.StartsWith('**') -and $bp.EndsWith('**') -and $bp.Length -ge 4){
          $t = $bp.Substring(2,$bp.Length-4)
          [void]$sb.Append('<w:r><w:rPr><w:b/></w:rPr><w:t xml:space="preserve">'+(Esc $t)+'</w:t></w:r>')
        } else {
          $iparts = [System.Text.RegularExpressions.Regex]::Split($bp, '(\*[^*]+\*)')
          foreach($ip in $iparts){
            if ($ip -eq '') { continue }
            if ($ip.StartsWith('*') -and $ip.EndsWith('*') -and $ip.Length -ge 2){
              $t = $ip.Substring(1,$ip.Length-2)
              [void]$sb.Append('<w:r><w:rPr><w:i/></w:rPr><w:t xml:space="preserve">'+(Esc $t)+'</w:t></w:r>')
            } else {
              [void]$sb.Append('<w:r><w:t xml:space="preserve">'+(Esc $ip)+'</w:t></w:r>')
            }
          }
        }
      }
    }
  }
  return $sb.ToString()
}

function Para([string]$inner,[string]$pPr=''){ return '<w:p>'+$pPr+$inner+'</w:p>' }

function Heading([int]$level,[string]$text){
  $sizes = @{1=36;2=30;3=28;4=26;5=24;6=24}
  $sz = $sizes[$level]; if(-not $sz){$sz=24}
  $before = if($level -le 2){'240'}else{'160'}
  $pPr = '<w:pPr><w:spacing w:before="'+$before+'" w:after="80" '+$LINE+'/><w:keepNext/></w:pPr>'
  $run = '<w:r><w:rPr><w:b/><w:sz w:val="'+$sz+'"/></w:rPr><w:t xml:space="preserve">'+(Esc $text)+'</w:t></w:r>'
  return Para $run $pPr
}
function CodeLine([string]$text){
  $pPr = '<w:pPr><w:spacing w:after="0" '+$LINE+'/><w:shd w:val="clear" w:fill="F4F4F4"/><w:ind w:left="120"/></w:pPr>'
  $run = '<w:r><w:rPr><w:rFonts w:ascii="Consolas" w:hAnsi="Consolas"/><w:sz w:val="20"/></w:rPr><w:t xml:space="preserve">'+(Esc $text)+'</w:t></w:r>'
  return Para $run $pPr
}
function Bullet([string]$text,[int]$indent=0){
  if($indent -gt 2){$indent=2}
  $pPr = '<w:pPr><w:numPr><w:ilvl w:val="'+$indent+'"/><w:numId w:val="1"/></w:numPr><w:spacing w:after="40" '+$LINE+'/></w:pPr>'
  return Para (Inline $text) $pPr
}
function NumItem([string]$text,[int]$numId){
  $pPr = '<w:pPr><w:numPr><w:ilvl w:val="0"/><w:numId w:val="'+$numId+'"/></w:numPr><w:spacing w:after="40" '+$LINE+'/></w:pPr>'
  return Para (Inline $text) $pPr
}
function BlockQuote([string]$text){
  $pPr = '<w:pPr><w:spacing w:after="60" '+$LINE+'/><w:ind w:left="360"/><w:pBdr><w:left w:val="single" w:sz="18" w:space="8" w:color="CCCCCC"/></w:pBdr></w:pPr>'
  $run = '<w:r><w:rPr><w:i/></w:rPr><w:t xml:space="preserve">'+(Esc $text)+'</w:t></w:r>'
  return Para $run $pPr
}

function AddImage([string]$alt,[string]$relpath){
  $script:imgCounter++
  $full = Join-Path $srcDir $relpath
  if(-not (Test-Path -LiteralPath $full)){ return Para (Inline ('[missing image: '+$relpath+']')) }
  $img = [System.Drawing.Image]::FromFile((Resolve-Path -LiteralPath $full))
  $w = $img.Width; $h = $img.Height; $img.Dispose()
  $wIn = [Math]::Min($maxImgWidthIn, $w/96.0)
  $scale = $wIn / ($w/96.0)
  $hIn = ($h/96.0) * $scale
  $cx = [int]([Math]::Round($wIn*$EMU)); $cy = [int]([Math]::Round($hIn*$EMU))
  $rid = 'rId'+($script:imgCounter + 2)   # rId1=styles, rId2=numbering, images start at rId3
  $script:images += @{ Id=$rid; File=('image'+$script:imgCounter+[System.IO.Path]::GetExtension($full)); Full=(Resolve-Path -LiteralPath $full).Path }
  $docPrId = 1000 + $script:imgCounter
  $drawing = '<w:r><w:drawing><wp:inline distT="0" distB="0" distL="0" distR="0"><wp:extent cx="'+$cx+'" cy="'+$cy+'"/><wp:effectExtent l="0" t="0" r="0" b="0"/><wp:docPr id="'+$docPrId+'" name="Picture '+$script:imgCounter+'" descr="'+(Esc $alt)+'"/><wp:cNvGraphicFramePr><a:graphicFrameLocks xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" noChangeAspect="1"/></wp:cNvGraphicFramePr><a:graphic xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"><a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture"><pic:pic xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture"><pic:nvPicPr><pic:cNvPr id="'+$docPrId+'" name="Picture '+$script:imgCounter+'"/><pic:cNvPicPr/></pic:nvPicPr><pic:blipFill><a:blip r:embed="'+$rid+'"/><a:stretch><a:fillRect/></a:stretch></pic:blipFill><pic:spPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="'+$cx+'" cy="'+$cy+'"/></a:xfrm><a:prstGeom prst="rect"><a:avLst/></a:prstGeom></pic:spPr></pic:pic></a:graphicData></a:graphic></wp:inline></w:drawing></w:r>'
  $capPr='<w:pPr><w:spacing w:before="40" w:after="160" '+$LINE+'/><w:jc w:val="center"/></w:pPr>'
  $cap = if($alt){ Para ('<w:r><w:rPr><w:i/><w:sz w:val="18"/></w:rPr><w:t xml:space="preserve">'+(Esc $alt)+'</w:t></w:r>') $capPr } else { '' }
  return (Para $drawing ('<w:pPr><w:jc w:val="center"/><w:spacing w:before="120" w:after="0" '+$LINE+'/></w:pPr>')) + $cap
}

function BuildTable([string[]]$rows){
  $cells = @(); foreach($r in $rows){ $cells += ,($r) }
  $header = $cells[0]; $body = @()
  for($i=2;$i -lt $cells.Count;$i++){ $body += ,$cells[$i] }
  function SplitRow([string]$r){
    $t = $r.Trim()
    if($t.StartsWith('|')){ $t = $t.Substring(1) }
    if($t.EndsWith('|')){ $t = $t.Substring(0,$t.Length-1) }
    return ($t -split '(?<!\\)\|') | ForEach-Object { $_.Trim() -replace '\\\|','|' }
  }
  $sb = New-Object System.Text.StringBuilder
  [void]$sb.Append('<w:tbl><w:tblPr><w:tblStyle w:val="TableGrid"/><w:tblW w:w="0" w:type="auto"/><w:tblBorders><w:top w:val="single" w:sz="4" w:color="BBBBBB"/><w:left w:val="single" w:sz="4" w:color="BBBBBB"/><w:bottom w:val="single" w:sz="4" w:color="BBBBBB"/><w:right w:val="single" w:sz="4" w:color="BBBBBB"/><w:insideH w:val="single" w:sz="4" w:color="DDDDDD"/><w:insideV w:val="single" w:sz="4" w:color="DDDDDD"/></w:tblBorders></w:tblPr>')
  $hc = SplitRow $header
  [void]$sb.Append('<w:tr>')
  foreach($c in $hc){
    [void]$sb.Append('<w:tc><w:tcPr><w:shd w:val="clear" w:fill="EDEDED"/></w:tcPr><w:p><w:pPr><w:spacing w:after="20" '+$LINE+'/></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t xml:space="preserve">'+(Esc $c)+'</w:t></w:r></w:p></w:tc>')
  }
  [void]$sb.Append('</w:tr>')
  foreach($br in $body){
    $bc = SplitRow $br
    [void]$sb.Append('<w:tr>')
    foreach($c in $bc){ [void]$sb.Append('<w:tc><w:p><w:pPr><w:spacing w:after="20" '+$LINE+'/></w:pPr>'+ (Inline $c) +'</w:p></w:tc>') }
    [void]$sb.Append('</w:tr>')
  }
  [void]$sb.Append('</w:tbl>')
  [void]$sb.Append((Para '' ('<w:pPr><w:spacing w:after="120" '+$LINE+'/></w:pPr>')))
  return $sb.ToString()
}

# ---- main parse ----
$body = New-Object System.Text.StringBuilder
$i = 0
while($i -lt $md.Count){
  $curline = $md[$i]; $trim = $curline.TrimEnd()

  if($trim -match '^\s*```'){
    $script:activeNumId = $null
    $i++
    while($i -lt $md.Count -and ($md[$i].TrimEnd() -notmatch '^\s*```')){ [void]$body.Append((CodeLine $md[$i])); $i++ }
    $i++
    [void]$body.Append((Para '' ('<w:pPr><w:spacing w:after="120" '+$LINE+'/></w:pPr>')))
    continue
  }
  if($trim -match '^\s*\|' -and ($i+1) -lt $md.Count -and $md[$i+1] -match '^\s*\|?[\s:|-]+\|?\s*$' -and $md[$i+1] -match '-'){
    $script:activeNumId = $null
    $tblRows = @()
    while($i -lt $md.Count -and $md[$i].Trim() -match '^\|'){ $tblRows += $md[$i]; $i++ }
    [void]$body.Append((BuildTable $tblRows)); continue
  }
  if($trim -match '^\s*!\[(.*?)\]\((.*?)\)\s*$'){
    $script:activeNumId = $null
    [void]$body.Append((AddImage $matches[1] $matches[2])); $i++; continue
  }
  if($trim -match '^\s*---\s*$' -or $trim -match '^\s*___\s*$' -or $trim -match '^\s*\*\*\*\s*$'){
    $script:activeNumId = $null
    [void]$body.Append((Para '' ('<w:pPr><w:pBdr><w:bottom w:val="single" w:sz="6" w:space="4" w:color="CCCCCC"/></w:pBdr><w:spacing w:after="120" '+$LINE+'/></w:pPr>')))
    $i++; continue
  }
  if($trim -match '^(#{1,6})\s+(.*)$'){
    $script:activeNumId = $null
    [void]$body.Append((Heading $matches[1].Length $matches[2])); $i++; continue
  }
  if($trim -match '^\s*>\s?(.*)$'){
    $script:activeNumId = $null
    [void]$body.Append((BlockQuote $matches[1])); $i++; continue
  }
  if($trim -match '^\s*(\d+)\.\s+(.*)$'){
    if($null -eq $script:activeNumId){
      $script:activeNumId = $script:nextNumId
      $script:numberedNumIds += $script:activeNumId
      $script:nextNumId++
    }
    [void]$body.Append((NumItem $matches[2] $script:activeNumId)); $i++; continue
  }
  if($trim -match '^(\s*)[-*]\s+(.*)$'){
    $script:activeNumId = $null
    $indent = [int]([Math]::Floor($matches[1].Length/2))
    [void]$body.Append((Bullet $matches[2] $indent)); $i++; continue
  }
  if($trim -eq ''){ $i++; continue }   # blank: keep running numbered list intact
  $script:activeNumId = $null
  [void]$body.Append((Para (Inline $trim) ('<w:pPr><w:spacing w:after="120" '+$LINE+'/></w:pPr>')))
  $i++
}

# ---- package ----
$tmp = Join-Path ([System.IO.Path]::GetTempPath()) ('docxbuild_'+[System.Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $tmp | Out-Null
New-Item -ItemType Directory -Path (Join-Path $tmp '_rels') | Out-Null
New-Item -ItemType Directory -Path (Join-Path $tmp 'word') | Out-Null
New-Item -ItemType Directory -Path (Join-Path $tmp 'word\_rels') | Out-Null
if($images.Count -gt 0){ New-Item -ItemType Directory -Path (Join-Path $tmp 'word\media') | Out-Null }

$docXml = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' +
 '<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessing" xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture">' +
 '<w:body>' + $body.ToString() +
 '<w:sectPr><w:pgSz w:w="12240" w:h="15840"/><w:pgMar w:top="1440" w:right="1440" w:bottom="1440" w:left="1440" w:header="720" w:footer="720" w:gutter="0"/></w:sectPr>' +
 '</w:body></w:document>'
[System.IO.File]::WriteAllText((Join-Path $tmp 'word\document.xml'), $docXml, (New-Object System.Text.UTF8Encoding($false)))

# styles.xml — document defaults: 12pt (sz 24), pure black, 1.15 line
$stylesXml = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' +
 '<w:styles xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">' +
 '<w:docDefaults><w:rPrDefault><w:rPr><w:rFonts w:ascii="Calibri" w:hAnsi="Calibri" w:cs="Calibri"/><w:color w:val="000000"/><w:sz w:val="24"/><w:szCs w:val="24"/></w:rPr></w:rPrDefault>' +
 '<w:pPrDefault><w:pPr><w:spacing w:after="0" w:line="276" w:lineRule="auto"/></w:pPr></w:pPrDefault></w:docDefaults>' +
 '<w:style w:type="table" w:styleId="TableGrid"><w:name w:val="Table Grid"/><w:tblPr></w:tblPr></w:style>' +
 '</w:styles>'
[System.IO.File]::WriteAllText((Join-Path $tmp 'word\styles.xml'), $stylesXml, (New-Object System.Text.UTF8Encoding($false)))

# numbering.xml — bullets (numId 1) + one restarting decimal list per numbered block
$absBullet = '<w:abstractNum w:abstractNumId="0"><w:multiLevelType w:val="hybridMultilevel"/>' +
 '<w:lvl w:ilvl="0"><w:start w:val="1"/><w:numFmt w:val="bullet"/><w:lvlText w:val="&#8226;"/><w:lvlJc w:val="left"/><w:pPr><w:ind w:left="720" w:hanging="360"/></w:pPr></w:lvl>' +
 '<w:lvl w:ilvl="1"><w:start w:val="1"/><w:numFmt w:val="bullet"/><w:lvlText w:val="o"/><w:lvlJc w:val="left"/><w:pPr><w:ind w:left="1080" w:hanging="360"/></w:pPr></w:lvl>' +
 '<w:lvl w:ilvl="2"><w:start w:val="1"/><w:numFmt w:val="bullet"/><w:lvlText w:val="&#9642;"/><w:lvlJc w:val="left"/><w:pPr><w:ind w:left="1440" w:hanging="360"/></w:pPr></w:lvl></w:abstractNum>'
$absDecimal = '<w:abstractNum w:abstractNumId="1"><w:multiLevelType w:val="singleLevel"/>' +
 '<w:lvl w:ilvl="0"><w:start w:val="1"/><w:numFmt w:val="decimal"/><w:lvlText w:val="%1."/><w:lvlJc w:val="left"/><w:pPr><w:ind w:left="720" w:hanging="360"/></w:pPr></w:lvl></w:abstractNum>'
$nums = '<w:num w:numId="1"><w:abstractNumId w:val="0"/></w:num>'
foreach($nid in $script:numberedNumIds){
  $nums += '<w:num w:numId="'+$nid+'"><w:abstractNumId w:val="1"/><w:lvlOverride w:ilvl="0"><w:startOverride w:val="1"/></w:lvlOverride></w:num>'
}
$numberingXml = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' +
 '<w:numbering xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">' + $absBullet + $absDecimal + $nums + '</w:numbering>'
[System.IO.File]::WriteAllText((Join-Path $tmp 'word\numbering.xml'), $numberingXml, (New-Object System.Text.UTF8Encoding($false)))

# content types
$ct = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">' +
 '<Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/><Default Extension="xml" ContentType="application/xml"/><Default Extension="png" ContentType="image/png"/><Default Extension="jpeg" ContentType="image/jpeg"/><Default Extension="jpg" ContentType="image/jpeg"/><Default Extension="gif" ContentType="image/gif"/>' +
 '<Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/>' +
 '<Override PartName="/word/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml"/>' +
 '<Override PartName="/word/numbering.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.numbering+xml"/></Types>'
[System.IO.File]::WriteAllText((Join-Path $tmp '[Content_Types].xml'), $ct, (New-Object System.Text.UTF8Encoding($false)))

$rootRels = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/></Relationships>'
[System.IO.File]::WriteAllText((Join-Path $tmp '_rels\.rels'), $rootRels, (New-Object System.Text.UTF8Encoding($false)))

$docRels = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">' +
 '<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/>' +
 '<Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/numbering" Target="numbering.xml"/>'
foreach($im in $images){
  Copy-Item -LiteralPath $im.Full -Destination (Join-Path $tmp ('word\media\'+$im.File))
  $docRels += '<Relationship Id="'+$im.Id+'" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/image" Target="media/'+$im.File+'"/>'
}
$docRels += '</Relationships>'
[System.IO.File]::WriteAllText((Join-Path $tmp 'word\_rels\document.xml.rels'), $docRels, (New-Object System.Text.UTF8Encoding($false)))

# zip with forward-slash entry names (OOXML requirement)
if(Test-Path -LiteralPath $Out){ Remove-Item -LiteralPath $Out -Force }
$fs = [System.IO.File]::Open($Out, [System.IO.FileMode]::Create)
$zip = New-Object System.IO.Compression.ZipArchive($fs, [System.IO.Compression.ZipArchiveMode]::Create)
foreach($file in (Get-ChildItem -LiteralPath $tmp -Recurse -File)){
  $rel = $file.FullName.Substring($tmp.Length+1) -replace '\\','/'
  $entry = $zip.CreateEntry($rel, [System.IO.Compression.CompressionLevel]::Optimal)
  $es = $entry.Open(); $bytes = [System.IO.File]::ReadAllBytes($file.FullName); $es.Write($bytes,0,$bytes.Length); $es.Close()
}
$zip.Dispose(); $fs.Close()
Remove-Item -LiteralPath $tmp -Recurse -Force
Write-Output ("WROTE " + $Out + " (" + ([Math]::Round(((Get-Item $Out).Length/1kb),1)) + " KB, images=" + $images.Count + ", numbered-lists=" + $script:numberedNumIds.Count + ")")
