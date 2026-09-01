---
name: incident-ogclipz-youtube-ban
description: 2026-07-30 — canalul YouTube OGCLIPZ terminat definitiv după 28 upload-uri + 12 ștergeri în câteva ore pe cont nou; regula de ritm pentru orice canal nou
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 4545310d-4b10-48f9-9b72-45984fa9ac6a
  modified: 2026-08-01T10:48:57.192Z
---

Pe 30 iulie 2026 am terminat definitiv canalul YouTube **Ogclipz**
(`UC7tShKgZOV4CkgBTRUG27Ww`, cont `ireneai020504@gmail.com`). Mesajul public:
*"This account has been terminated for violating YouTube or Google's Terms of Service."*

**Ce am făcut greșit:** canalul avea două zile și zero istoric. În câteva ore am urcat 28 de
clipuri (conținut reutilizat Hormozi/Gadzhi, doar recadrat + subtitrat) și am șters 12 dintre
ele când am descoperit un bug audio. Volum mare + cont nou + conținut reutilizat + ștergeri în
masă = tiparul clasic de spam automat.

**Semnalul pe care l-am ignorat:** YouTube a răspuns `uploadLimitExceeded` (HTTP 400) după
al 16-lea upload. L-am tratat ca pe o cotă tehnică de așteptat până a doua zi și am reîncercat.
Era de fapt frâna de siguranță. Următorul răspuns a fost `authenticatedUserAccountSuspended`.

**Why:** CLAUDE.md al Clip Factory (§5) spune explicit că gâtuirea nu e randarea ci conturile
încălzite și postarea sigură. Am tratat plafonul ca pe un obstacol de ocolit, nu ca pe o limită
de respectat. Randarea e ieftină; un canal ars nu se recuperează.

**How to apply:**
- Canal nou = maximum 2-3 postări pe zi în prima săptămână, apoi creștere lentă. Niciodată
  zeci de upload-uri în aceeași zi pe un cont fără istoric.
- `uploadLimitExceeded` / orice limită de rată = **oprește-te pe ziua respectivă**, nu reîncerca.
- Nu șterge în masă ce tocmai ai urcat. Dacă un lot are un defect, lasă-l și corectează de la
  clipul următor, sau șterge câte unul, rar.
- Verifică un clip complet (inclusiv audio, ascultat/măsurat) **înainte** de primul lot, nu după.
- Distribuția merge prin procesul de încălzire din `config/accounts.md`, nu prin buclă de API.

Legat de [[project_clip_factory]].
