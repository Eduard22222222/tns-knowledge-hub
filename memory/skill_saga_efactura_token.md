---
name: skill_saga_efactura_token
description: "Cum verifici daca SAGA poate incarca in e-Factura: tokenul ANAF e in SETARI_G, tine 90 zile, se reinnoieste doar cu stickul fizic"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 7b813f9a-b9e1-4db6-8373-607368bc524d
  modified: 2026-08-26T15:31:15.581Z
---

**Inainte sa incerci sa urci ceva in e-Factura din SAGA, verifica tokenul — nu ghici.**

SAGA stocheaza tokenul OAuth ANAF in tabela `SETARI_G` (pereche COD/VALOARE), **spart in bucati de 254 caractere**:
- `E_FACTURA_COD_JWT_ACCES01..08` — access token (JWT)
- `E_FACTURA_COD_JWT_REFRESH01..07` — refresh token

Reteta (cu SAGA **inchis**, altfel baza e blocata):
1. `isql -u SYSDBA -p masterkey` pe `E:\SAGA C.3.0\0003\cont_baza.fdb` (cale directa, fara `localhost:` — vezi [[skill_saga_firebird_direct_read]])
2. `SELECT TRIM(VALOARE) FROM SETARI_G WHERE UPPER(COD) LIKE 'E_FACTURA_COD_JWT_ACCES%' ORDER BY COD;` → **scrie in fisier**, nu in stdout, ca sa nu ajunga tokenul in conversatie
3. Concateneaza bucatile, split pe `.`, base64url-decode segmentul 2, citeste `exp`
4. Sterge fisierul temporar

Tokenul ANAF tine **90 de zile** (`iss: https://logincert.anaf.ro`) si **se reinnoieste exclusiv cu certificatul fizic pe stick** + PIN introdus de Eduard. Fara stick nu exista nicio cale de ocolire — SAGA nu poate obtine token nou, deci nu urca nimic.

**Semnal rapid fara SQL:** in grila Operatii → Iesiri, coloana **`ID incarcare SPV`**. Facturile cu ID au fost transmise; cele fara ID nu. Daca facturile vechi au ID si cele noi nu, tokenul a expirat intre ele. La Conta4U: facturile 1–5 aveau ID (ultima 14.07.2026), 6 si 7 nu — token expirat 25.07.2026.

**Verifica si stickul:** `certutil -scinfo` → cauta reader-ul **`Longmai mToken CryptoIDE 0`**. `SCARD_STATE_PRESENT | SCARD_STATE_INUSE` = conectat si folosit; `SCARD_STATE_EMPTY / No card` = nu e bagat. Ignora reader-ele `AKS ifdh` / `AKS VR`, sunt mereu goale. Comanda poate dura >2 min — ruleaza-o in background.

**RETETA DE TRANSMITERE (verificata 26.08.2026):**
1. Ecranul principal SAGA → linkul **`e-Facturi (N)`** dreapta-sus (nu exista in meniuri; daca e deschisa fereastra Iesiri, linkul e acoperit)
2. Tab **„Generare si transmitere e-Facturi"** → seteaza intervalul de date → facturile netransmise apar in lista
3. **Butonul `Cod de acces SPV` (dreapta-jos) este pasul care conteaza** — el reinnoieste tokenul si transmite. Butonul **`Accept` nu face nimic** cat timp tokenul e expirat, indiferent de cate ori il apesi (am pierdut timp aici).
4. Rezultat: coloana **`Stare`** devine `Transmisa`, iar in **`Detalii`** apare `e-Factura a fost incarcata cu succes. Index: <nr>`. Noteaza indexul per factura — se vede dand click pe fiecare rand.
5. Validarea ANAF vine mai tarziu, in tab **„(1) Raspunsuri e-Facturi"** (contor `Erori facturi`).

**Dialogul de certificat/PIN (CredentialUIBroker, „Securitate Windows") se randeaza NEGRU** — la fel ca la D406. Daca apare la pornirea SAGA si ramane blocat, inchide-l si **reporneste SAGA**: altfel ramane si fereastra de selectie firma inchisa, iar SAGA sta pe ecranul gol fara meniu. PIN-ul il introduce Eduard, niciodata Claude.

**Termen legal:** factura B2B RO–RO trebuie transmisa in 5 zile lucratoare de la emitere. Clientii din afara UE (ex. SUA) **nu** intra in e-Factura.

Vezi [[project_saga_conta4u_setup]] si [[skill_saga_d406_generare]].
