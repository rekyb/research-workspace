#!/usr/bin/env python3
"""Convert a research Markdown file to .docx using python-docx.

Pragmatic converter tuned for SYNTHESIS.md / README.md structure. Handles:
  - # / ## / ### / #### headings
  - unordered (- , * ) and ordered (1. ) list items, with **bold** lead-ins
  - **bold** and *italic* inline spans
  - horizontal rules (---) and blank-line paragraph breaks
  - simple pipe tables (| a | b |)

Usage: python3 md_to_docx.py INPUT.md [OUTPUT.docx]
       (defaults OUTPUT to INPUT with .docx extension)
"""
import re
import sys
from pathlib import Path

try:
    from docx import Document
    from docx.shared import Pt
except ImportError:
    sys.exit("python-docx is not installed. Run: pip install python-docx")

INLINE = re.compile(r"(\*\*.+?\*\*|\*.+?\*|`.+?`)")


def add_inline(paragraph, text):
    """Add text to a paragraph, rendering **bold**, *italic*, `code` spans."""
    for part in INLINE.split(text):
        if not part:
            continue
        if part.startswith("**") and part.endswith("**"):
            paragraph.add_run(part[2:-2]).bold = True
        elif part.startswith("*") and part.endswith("*"):
            paragraph.add_run(part[1:-1]).italic = True
        elif part.startswith("`") and part.endswith("`"):
            run = paragraph.add_run(part[1:-1])
            run.font.name = "Consolas"
        else:
            paragraph.add_run(part)


def flush_table(doc, rows):
    """Render collected pipe-table rows (list of cell-lists)."""
    rows = [r for r in rows if not re.match(r"^[\s|:-]+$", " ".join(r))]
    if not rows:
        return
    cols = max(len(r) for r in rows)
    table = doc.add_table(rows=0, cols=cols)
    table.style = "Light Grid Accent 1"
    for r in rows:
        cells = table.add_row().cells
        for i in range(cols):
            cells[i].text = r[i] if i < len(r) else ""


def convert(md_path, docx_path):
    lines = Path(md_path).read_text(encoding="utf-8").splitlines()
    doc = Document()
    doc.styles["Normal"].font.size = Pt(11)

    table_buf = []
    for raw in lines:
        line = raw.rstrip()

        if line.startswith("|") and line.count("|") >= 2:
            table_buf.append([c.strip() for c in line.strip("|").split("|")])
            continue
        elif table_buf:
            flush_table(doc, table_buf)
            table_buf = []

        if not line.strip():
            continue
        if re.match(r"^-{3,}$", line.strip()):
            continue

        m = re.match(r"^(#{1,4})\s+(.*)", line)
        if m:
            doc.add_heading(m.group(2).strip(), level=len(m.group(1)))
            continue

        m = re.match(r"^\s*[-*]\s+(.*)", line)
        if m:
            p = doc.add_paragraph(style="List Bullet")
            add_inline(p, m.group(1))
            continue

        m = re.match(r"^\s*\d+\.\s+(.*)", line)
        if m:
            p = doc.add_paragraph(style="List Number")
            add_inline(p, m.group(1))
            continue

        p = doc.add_paragraph()
        add_inline(p, line)

    if table_buf:
        flush_table(doc, table_buf)

    doc.save(docx_path)
    return docx_path


if __name__ == "__main__":
    if len(sys.argv) < 2:
        sys.exit("Usage: python3 md_to_docx.py INPUT.md [OUTPUT.docx]")
    src = sys.argv[1]
    dst = sys.argv[2] if len(sys.argv) > 2 else str(Path(src).with_suffix(".docx"))
    print(convert(src, dst))
