# Platform Merdeka Mengajar → Rumah Pendidikan (Ruang GTK): access notes

**Summary:** The Indonesian government teacher platform formerly known as **Platform Merdeka
Mengajar (PMM)** has been restructured: PMM's teacher space became **Ruang GTK**, now
integrated into **"Rumah Pendidikan (Ruang GTK)."** The in-app *Sertifikat* (certificate)
flow from **Pelatihan Mandiri** (self-paced training) sits behind government SSO
(**belajar.id**) login. Per workspace guardrails I did **not** log in with real teacher
credentials, so the in-app certificate flow could **not** be captured. What is observable for
free is the public Google Play listing, captured below.

1. **Public Play Store listing.** The app **"Rumah Pendidikan (Ruang GTK)"** by *Kementerian
   Pendidikan Dasar dan Menengah RI* shows **4.9★ (228K reviews), Government, 5M+ downloads.**
   The account avatar in the browser chrome was **redacted** before capture (grey "REDACTED"
   badge, top-right).
   *Evidence: `screenshots/01-play-listing.png`.*
   The listing description confirms the platform's purpose: "competency development and
   improvement" and access to teacher services, but does not itself show the certificate UI.

**Dead-end (documented gate):** the certificate mechanic that motivated this benchmark lives
inside the authenticated app and cannot be reached without government SSO. This is the
login/PII risk the PLAN anticipated. The *effect* of PMM's certificate-and-enjoyment model is
instead evidenced from the literature (two directly-Indonesian sources: PMM-enjoyment adoption
study; the 2007-08 certification evaluation), see `references.md`.
