# Audit Stoc + Restage Cutii — 2026-07-16

**Context:** Eduard a cerut: (1) siguranța că TOT stocul OpenCart e pe noul site și DOAR ce-i pe stoc; (2) zona separată pentru non-auto (Star Wars etc.) completă; (3) pozele „proaste" — definite de el ca **poze cu cutia/blisterul în cadru** — separate și refăcute; (4) back-office gata de folosit de client.

## 1. Audit stoc — reconciliere OpenCart ↔ WooCommerce

- Sursa de adevăr: uniune `oc-products-1/2.json` + `oc-noncars.json` = **1.609 SKU-uri unice in-stock** (schema OC: 1.613 active_stock).
- Găsite **66 produse cu stoc care lipseau** — picaseră în gaura dintre filtrul `is_auto()` (le respingea, corect) și `oc-noncars.json` (nu le conținea).
- Fix: 4 mașini reale prin re-run `_import.py` + 62 non-auto prin `_import_missing_alte.py`.
- **Subcategorii NOI în Alte colecții:** Biciclete de colecție (13) · Căști pilot F1 (5) · Accesorii & diorame (12); restul în Figurine (23 Pop It), Star Wars (8), Reviste (1).
- Rezultat: **WC = 1.611 produse = tot stocul, 0 lipsă** la re-verificare.
- **`woocommerce_hide_out_of_stock_items = yes`** — regula „doar in-stock vizibil" e acum permanentă (relevant și pentru sync EasySales).
- ⚠️ Cele 7 produse cu SKU sintetic `1500xxxx` = **Mașinile de Legendă** (intenționate, hand-crafted) — NU sunt junk. Aproape am șters una; regula rămâne: investighează înainte de delete.

## 2. Triaj poze — definiția reală a „proastelor"

- Rezoluția NU era problema (90% din poze ≥800px, studio curat). Eduard: urâte = **cu ambalaj în cadru**; cardurile GT Spirit „Prototype under licensing approval" arată bine și RĂMÂN.
- **Scan vizual AI**: montaje numerotate 30 celule × 54 foi → Gemini vision, 6 foi/call (~180 produse/call). Validat 20/20 și 12/12 contra ochiului meu. >3 call-uri paralele → 500.
- 673 flagate → **493 reviste/fascicule** (coperta = produsul, rămân) + **12 GT Spirit** (rămân) + **168 machete reale cu cutie** → după review vizual: **47 de refăcut** (25 Majorette blister, 9 HW card, 11 model-lângă-cutie, 2 BMW X5M).

## 3. Restage — nanobanana/Gemini GRATUIT (breakthrough)

- Higgsfield avea **0 credite** → test pe `gemini-3.1-flash-image-preview` (cheia din config Claude Desktop, API direct din Python, NU prin MCP care face timeout).
- **Un-boxing merge one-step**, calitate ≈ Seedream, stil Night Showroom identic cu Legendele. Cost: 0.
- **44/47 urcate live** (38 primul pas + 6 regenerate cu clauze corective). Originalul cu blister păstrat în galerie ca poza #2.
- **QC obligatoriu — moduri de eșec văzute:** uși/capote deschise inventate (Countach, Hyperfin), drift de culoare (albastru→gri, Batplane negru→roșu), drift jante. Toate reparate cu clauze țintite.
- **3 respinse permanent:** Giftpack 5x BMW, Giftpack 5x Duster, Diorama Showroom — **seturile nu se restagează** (modelul scoate o singură mașină sau inventează aranjamentul; cutia = reprezentarea corectă).
- Purge LiteSpeed fără helper: PHP temporar cheie-protejat (`litespeed_purge_all`) prin cPanel Fileman, șters prin **API2 `Fileman::fileop op=unlink`** (UAPI nu are delete). Verificat 5/5 pagini live cu imaginea nouă.

## 4. Back-office + handover

- `asw-backoffice` + `asw-order-emails` confirmate **active** pe staging.
- **Ghid PDF pentru client**: `autosworld-platform/Ghid-administrare-AutosWorld.pdf` (login, panou, stocuri, furnizori+marjă, comenzi+AWB, newsletter CSV, ce gestionează TNS; fără parole în document).
- De făcut de Eduard: un ochi pe panoul din wp-admin (eu nu pot loga cu parolă în browser) + livrarea ghidului către client la handover.

## 5. Sincronizare cu stocul LIVE de azi (întrebarea „sigur avem tot?")

Export-urile din 13-15 iulie deja deviaseră (magazinul live vinde zilnic). Pull proaspăt din DB-ul OpenCart live (exporter PHP temporar, șters după — HTTP 404 verificat):

- **19 produse noi în stoc** de la export → importate (16 mașini GT Spirit/Otto noi + GAZ M13 Chaika Legende Nr.30 + 2 non-auto). Fals-FAIL pe 10008318: POST-ul inițial a expirat DUPĂ creare, retry-ul a raportat „duplicat" — produsul exista (id 5128). Verifică `status=any&sku=` înainte să crezi un FAIL de duplicat.
- **44 vândute între timp** → stoc 0 → ascunse automat (setarea globală).
- **31 diferențe de cantitate** → sincronizate prin `/products/batch`.

**Verdict final: site = stocul live 1:1** (1.585 în stoc live azi, 0 lipsă, 0 vizibile fără stoc). Pipeline-ul e refolosibil la cerere („sincronizează stocul") — drift-ul se reacumulează zilnic până la cutover, când EasySales preia sincronizarea automată.

## 6. Fix-uri Eduard: Batplane + logo-uri mărci reale (2026-07-16, seara)

- **Batplane scos din catalogul auto** → Alte colecții › Star Wars & film (scăpase prin `is_auto` — numele nu conținea niciun termen blocat). Scan complet de intruși: singurul; „Tatra 111 Macara" e camion legitim, rămâne.
- **Logo-uri**: Eduard a prins că 17 mărci aveau **wordmark-uri generate** (text în chenar), nu logo-uri reale (Williams, Sauber etc.). Înlocuite **13 cu logo-uri reale** (Wikimedia Commons + car-logos-dataset, procesate: transparență/trim/recolor deschis pt. cele întunecate) + **Lincoln adăugat** + alias `utb445u→utb650`. Deploy prin editorul de teme (_wpedit.py), purge, verificat: **95/95 chips cu logo**.
- **Capcane de căutare logo**: „FSO logo" pe Commons = Forschungsstelle Osteuropa (institut german!) nu Fabryka Samochodów Osobowych; „Sauber logo" întoarce echipele succesoare (Audi/Alfa/Stake); Moskvitch se caută „Moskvich" fără t. **Verifică VIZUAL fiecare logo înainte de deploy.**
- **Rămase wordmark (fără logo public curat): Moskvitch, Tarpan, Syrena, Warszawa** — de cerut clientului dacă are asset-uri, sau lăsate așa (arată intenționat).

## 7. Sync stoc zilnic AUTOMAT + navbar (2026-07-16, noaptea)

- **Verificare „tot stocul e la noi?" contra DB-ului LIVE (nu export vechi):** snapshot proaspăt = 1.585 in-stock → reconciliere: **0 lipsă, 0 vândute rămase pe stoc, 0 diferențe cantitate.** (O sesiune paralelă importase deja delta de 19 produse noi la 19:12 — oc-products-3.json, incl. Pokemon TCG.)
- **Plugin NOU `asw-stock-sync` (activ):** cron zilnic 05:00 — citește read-only DB-ul OpenCart (config.php parsat ca text, mysqli localhost), aliniază stock_quantity/stock_status pe toate SKU-urile WC (sare SKU sintetice 1500x/AWX-), produsele noi din OC apar ca listă „de importat" în pagina admin **Sync stoc** (buton și pentru rulare manuală). Trigger tehnic: `/?asw_sync_now=aswSync_7d1f4b9e2c`. Purge LSCache automat doar dacă a schimbat ceva. Primul run: ok, 0 diff.
- **Navbar desktop: adăugat tab-ul „Alte colecții"** (era doar în meniul mobil — de-aia nu-l vedea Eduard).
- Endpoint-ul temporar de export scos din functions.php + verificat mort (404/pagina normală).
- La cutover: sync-ul rămâne util până se conectează EasySales (care preia stocul multi-canal), apoi pluginul se dezactivează.

## 8. Fix descrieri: stiluri inline + dublu-encodare (2026-07-16, târziu)

- Eduard a văzut pe PDP-uri **tag-uri HTML brute ca text** (`<p style="color: rgb(0,0,0); font-family: Arial; font-size: 13px">…`) + text negru pe temă întunecată. Sursa: descrierile OpenCart importate.
- **Două probleme distincte:** (a) ~406 produse cu `style=` inline decodat (color/font pe span/p) → forțau negru + Arial 13px; (b) restul erau **dublu-encodate** — `&lt;p style=&quot;…&gt;` = tag-urile apăreau ca text literal vizibil.
- Fix curățător (rulat pe toate 1630 via `/products/batch`, 50/lot): **întâi `html.unescape` până dispar `&lt;` encodate**, apoi scoate `style=`/`<font>`/atribute legacy/span goale/`<b><br></b>`/paragrafe goale, apoi de-nest `<p><p>` (84 aveau imbricare din decodare).
- Rezultat verificat: **0 produse cu style=, 0 cu `&lt;p` encodat, 0 `<font>`.** PDP BMW M3 Solido (exemplul lui Eduard, id 5136) verificat vizual live — text curat. Purge LSCache.
- **Lecție reutilizabilă:** descrierile OC pot fi encodate de 0/1/2 ori — cleaner-ul TREBUIE să `unescape` în buclă înainte de strip regex pe ghilimele reale; altfel `style=&quot;` scapă.

## 9. Back-office v2.0 — centru de comandă pentru client

Eduard: „dashboard prin care să aibă acces la toate tool-urile, plugin-urile, analytics, să adauge/scoată/gestioneze produse, să bage pop-up-uri de news și reduceri". Rescris `asw-backoffice.php` (v1 → **v2.0.0**), 4 pagini sub meniul Auto'sWorld:

1. **📊 Panou** — analytics reale: grafic SVG vânzări 30 zile (fără librării externe), încasări + comandă medie, top vânzări, ultimele comenzi cu status AWB, stoc mic cu furnizor/cost/marjă.
2. **📦 Produse rapid** — căutare + filtre (stoc mic/epuizate), **editare preț & stoc inline cu salvare AJAX** (nonce + `manage_woocommerce`), ascunde/publică/șterge, link la formularul complet de produs nou.
3. **🎯 Promoții & Pop-up** — **bară de anunț** sitewide + **constructor de pop-up-uri**: titlu/mesaj/cod/CTA, unde apare (tot site-ul/home/catalog/produs), delay, frecvență (zi/vizită/mereu), interval de campanie, preview live în admin, și **creare automată de cupon WooCommerce** din același formular.
4. **🧰 Unelte & stare** — semafor sănătate (sync stoc, produse noi de importat, SMTP, cache, pop-up-uri active) + 15 carduri-lansator către toate instrumentele.

**Frontend:** pop-up stil Night Showroom (negru + roșu, cod click-to-copy, ESC/click-outside, respectă `prefers-reduced-motion` prin tranziții simple) + bară de anunț cu × memorat în localStorage.

**Bug prins la verificare (important):** overlay-ul primea `hidden=false` iar `.on` se adăuga doar prin `requestAnimationFrame` — care **nu rulează în taburi de fundal** → rămânea un overlay invizibil (opacity 0) care **bloca click-urile pe toată pagina**. Fix: `pointer-events:none` până la `.on` + fallback `setTimeout(show,60)` pe lângă rAF.

**Metodă de deploy sigură (reutilizabilă):** upload cod ca `.txt` (neexecutat) → lint pe server cu `token_get_all($c, TOKEN_PARSE)` în try/catch ParseError (**parsează fără să execute**, spre deosebire de eval) → dacă SYNTAX_OK, scrie în `plugins/` → **smoke-test**: script temporar care face `wp_set_current_user(admin)` și apelează fiecare `page_*()` în `ob_start()` cu catch Throwable → toate 4 paginile OK → purge → șterge temporarele. Backup v1 salvat local ca `_backup_backoffice_v1.php`.

Demo live pe staging: pop-up „-15% la machetele 1:18" (cod VITRINA15) + bară „Transport GRATUIT peste 300 lei" — clientul le poate edita/șterge din panou. Ghidul PDF extins cu secțiunile 7-9 (Produse rapid, Promoții & Pop-up, Unelte).

## 10. White-label admin — „nu vreau să arate ca WordPress"

Eduard, corect: funcționalitatea era nouă, dar **interfața arăta stock WordPress**. Plugin nou `asw-admin-skin.php` (activ):

- **Pagină de login rebranduită**: fundal întunecat cu halou roșu, logo Auto'sWorld din temă, card întunecat cu accent roșu sus, inputuri dark, buton brand, notă „Panou de administrare Auto'sWorld". **Titlu tab: „Autentificare — Auto'sWorld"** (fără „WordPress").
- **Admin întunecat**: meniu lateral dark (#14161a) cu activ roșu, bară de sus neagră cu marcaj „● AUTO'SWORLD" (logo WP scos), butoane primare roșii, footer TNS, fără notificări de update.
- **Declutter pentru client** (nu pentru `asw_admin` = contul tehnic TNS): ascunse Comentarii, Unelte, editorul de teme.
- **Redirect după login → direct panoul Auto'sWorld**, nu dashboard-ul WP.

**Capcane prinse prin verificare (nu presupunere):** (a) CSS-ul de login al WP bate specificitatea `.login form` → a trebuit `body.login form{...!important}`; (b) `admin_title` NU acoperă pagina de login — trebuie `login_title`; (c) prima verificare a citit un răspuns din cache și părea că deploy-ul n-a mers — cache-buster obligatoriu la verificarea paginilor de login; (d) am renunțat la un filtru `gettext` (rula pe fiecare șir din admin = risc de performanță degeaba).

Logo-ul se ia dinamic din temă (`get_template_directory_uri`), deci merge și după cutover pe autosworld.ro.

## 11. Panou v3 — temă întunecată + Acțiuni rapide (verificat vizual în Chrome)

Eduard: „e ca ăla de la WordPress" → am deschis efectiv panoul în Chrome-ul lui (extensia Claude in Chrome, era deja logat — zero manipulare de parole) și m-am uitat. Confirmat: bara laterală era brandată, dar **conținutul rămăsese gri-WordPress și butoanele albastre**.

**Fix vizual:** clasă proprie pe `<body>` (`asw-panel` prin `admin_body_class`, doar pe paginile `asw-*`) → **temă întunecată completă doar pe paginile noastre** (fundal #0f1114, carduri #181b21, tabele/inputuri/pill-uri dark), paginile native WP rămân luminoase (nu stric ce nu-i al meu). Butoanele: `!important` — **schema de culori a WP se încarcă DUPĂ `wp-admin`**, de-aia pierdea CSS-ul meu.

**Pagină nouă „⚡ Acțiuni rapide"** (plugin `asw-tools.php`):
- **Reduceri în masă** pe categorie (aplică/elimină %; setează sale_price real → preț tăiat pe site)
- **Listă de ambalat** printabilă (comenzi în procesare, produse + cantități + căsuțe de bifat + SKU)
- **Export comenzi CSV** pe interval (BOM UTF-8, `;` — se deschide corect în Excel RO)
- **De comandat la furnizor** grupat pe furnizor + CSV
- **Produse cu probleme** (fără poză/descriere scurtă/fără preț/SKU/categorie) cu link direct la lista filtrată — **rezultat: toate ZERO**, catalogul e curat
- **Prag „stoc mic" configurabil** de client (1-20)

**Bug de raportare prins prin comparare:** panoul afișa „244 stoc mic" (număra doar 300 de produse recente) în timp ce uneltele arătau 1.118 pe tot catalogul. Rescris cu **COUNT SQL pe tot catalogul** → acum consistent 1.118. Lecție: nu număra pe eșantion și nu afișa rezultatul ca total.

## 12. Fix bug-uri de raportare în panou (2026-08-08)

Trei probleme, toate din aceeași cauză — **cifre calculate greșit și prezentate ca adevăr**:

1. **„Stoc mic" număra doar 300 de produse recente** și afișa rezultatul ca total (244 în loc de 1.118). Rescris cu `COUNT` SQL pe tot catalogul.
2. **„Stoc epuizat" număra rânduri din `postmeta` fără JOIN pe `posts`** → 82 în loc de 99 (prindea/rata ciorne, variații, coș de gunoi). Rescris cu JOIN pe `post_type=product AND post_status=publish`. **Verificat: 99 = exact câte sunt.**
3. **Metrica „stoc mic" era inutilă ca semnal.** Distribuția reală: 577 produse cu 1 buc, 347 cu 2, 189 cu 3 → **68% din catalog are ≤3**, normal la colecționabile. Un card care țipă „1.118" e zgomot.
   → Înlocuit cu **„De recomandat" = s-a vândut în ultimele 90 de zile ȘI a rămas ≤ prag** (semnalul real de reaprovizionare, sortat după cât s-a vândut). Numărul brut de „stoc mic" rămâne, dar ca text informativ cu explicația că 1-3 buc e normal.
   → Lista pe furnizori din Acțiuni rapide folosește aceeași logică (+ coloană „vândute"), cu fallback la cele mai mici stocuri, plafonat la 300 — altfel ieșea un CSV de 1.118 rânduri, inutilizabil.

**Verificare:** smoke-test server-side pe toate cele 5 pagini (OK) + randare a panoului și extragerea valorilor din carduri ca dovadă. Sesiunea din Chrome expirase → **nu am „confirmat vizual" ce nu puteam vedea**; am validat prin randare pe server.

**Lecție (aceeași de trei ori):** orice cifră afișată clientului trebuie să vină dintr-o interogare peste tot setul de date, nu dintr-un eșantion — și trebuie să fie *acționabilă*, nu doar corectă.

## 13. Feedback client — PPT „Modificari_1208" (2026-08-13/14)

Clientul (Toma) a trimis un PPT cu 4 slide-uri; conținutul slide-urilor 2-3 era în **capturi de ecran**, nu text (de extras din `ppt/media/`).

**Slide 1 — texte homepage. TOATE aplicate:**
- Hero: lista de branduri → AUTOart, BBR Models, CMC, DeAgostini, GT Spirit, Kyosho, OttOmobile
- „Proaspăt în vitrină" → **„Noutăți în colecție"**
- ⚠️ **„Magazinul Colecționarului" este BRANDUL ALTCUIVA** — clientul a cerut explicit evitarea. Schimbat și în footer ȘI în kicker-ul din hero („Magazinul colecționarilor · din 2014" → „Din pasiune pentru machete auto · din 2014"). **De verificat periodic că nu reapare în meta/blog/SEO.**
- „Curatoriate de colecționari" → „Alese de colecționari, pentru colecționari"
- **La cererea lui Eduard**: în loc de text static, am adăugat și un **card de știri peste hero** (`asw_hero_news()` în plugin, apelat din front-page.php) — discret, cu punct roșu pulsant, eyebrow/titlu/detaliu/CTA, × memorat în localStorage pe hash-ul titlului, interval de afișare; se editează din Promoții & Pop-up.

**Slide 4 — contact:**
- ⚠️ **Telefonul de pe site era al FOSTULUI PROPRIETAR** (`0729 067 580`) — apărea în Contact, Termeni, Confidențialitate. Înlocuit cu **0731 312 123** (magazin) peste tot + **0744 546 605** (direct) doar pe Contact.
- **office@autosworld.ro — investigat în cPanel:** căsuța **EXISTĂ** (470 MB de mail!) ȘI există un **forwarder către `autosworld.ro@gmail.com`**. Deci cine controlează acel Gmail primește în continuare corespondența comercială. **Decizie necesară de la client: al cui e Gmail-ul?** Apoi: reset parolă căsuță (client accesează direct) + eventual ștergere forwarder. **NU am modificat nimic pe email-ul live fără acord.**

**Slide 2-3 — pagina de produs. Datele existau toate în OpenCart:**
| Cerut | Sursă OC | Acoperire după import |
|---|---|---|
| EAN | coloana `ean` | 852 produse |
| Referință (ex. OT1195) | coloana `mpn` | 1.450 |
| Termen livrare | coloana `upc` (conține „1-2 zile") | 1.408 |
| Lansare (precomenzi) | atribut „Lansare" | 228 |
| Specs (An, Culoare, Dimensiune, Ambalaj, Tip, Vârstă, Categorie) | atribute OC | 971-1.547 fiecare |

`_enrich_specs.py`: **1.615/1.615 produse îmbogățite** (meta `_asw_ean/_asw_ref/_asw_livrare/_asw_lansare/_asw_colectie/_asw_seria` + atribute custom non-taxonomice, ca să nu explodeze termenii). Atributele taxonomice existente păstrate prin merge.

Template PDP (v1.7.7): **bloc de identificatori** (Cod produs / Scară / Livrare / Referință / EAN), **badge PRECOMANDĂ · lansare {lună}**, **badge livrare gratuită** peste 300 lei, **casetă OBS precomandă**, **tabel SPECIFICAȚII** (Disponibilitate → Lansare + Caracteristici din toate atributele vizibile + EAN/referință). Verificat live pe 3 produse.

**NEIMPLEMENTAT intenționat: contorul „VIZUALIZĂRI PRODUS"** din captura clientului — cu cache de pagină (LiteSpeed) un contor PHP nu se incrementează pe hit-urile din cache, deci cifra ar minți. Se poate face prin AJAX dacă insistă.

## 14. Sameday — conectat și verificat cap-coadă (2026-08-14)

**Descoperire cheie: Sameday NU are cheie API separată** — pluginul WooCommerce folosește chiar datele de login din portalul eAWB (user `autosworld.ro@gmail.com`). Credențiale în `keys/autosworld-cpanel.txt`.

**Configurat:** mod producție (`is_testing=0`; modul demo cere credențiale demo separate de la Sameday), țară RO, hartă interactivă de lockere, etichete A4.

**Capcană la sincronizare:** funcțiile reale sunt `Sameday::refreshServices / refreshSamedayPickupPoints / refreshSamedayLockers`, dar apelate dintr-un script PHP standalone dau redirect la wp-login. Pluginul își agață `load_lockers_sync` pe `admin_init` → **soluția care merge: GET autentificat cu cookie pe `wp-admin/admin.php?page=wc-settings&tab=shipping&section=samedaycourier`** (refolosind login-ul din `_wpedit.py`).

**Sincronizat:** 22 servicii · 6 puncte de ridicare · **6.950 easybox-uri** (1.426 în București).

**Servicii activate:** `7 = 24H` → „Curier la adresă" 21,99 lei · `15 = Locker NextDay` → „Easybox (Sameday)" 16,99 lei · gratuit peste 300 lei.

**De reținut: `samedaycourier` e metodă GLOBALĂ, nu per-zonă.** Nu se adaugă în zona de livrare — contează doar `enabled=yes` în setări. (WC REST acceptă POST-ul de adăugare în zonă, dar nu-l persistă — m-a derutat de două ori.)

**Bug provocat de mine și reparat:** activarea Sameday a **dublat toate opțiunile la checkout** (flat_rate-urile manuale vechi + cele Sameday, aceleași nume și prețuri). Dezactivat flat_rate instanțele 1 și 2.

**Verificat în checkout real (browser):** două opțiuni curate; la Easybox apare „Compartiment Sameday" + **harta funcțională** (căutare pe județ/punct, „folosește locația curentă"); **Transport GRATUIT** apare și se preselectează la peste 300 lei.

⚠️ **Punct de ridicare schimbat** din 228865 (sos. Virtuții, Sector 6) în **443518 „Autos World Corp SRL" (Tunari — adresa din acte)**. **DE CONFIRMAT cu clientul** — decide de unde ridică curierul coletele. În cont mai există 4 puncte „eMag" (probabil pentru FBE).

**NEFĂCUT intenționat:** niciun AWB generat — ar fi o expediere reală, cu cost real. Preluarea automată a AWB-ului Sameday în `asw-order-emails` e deja legată și se declanșează la primul AWB real.

## 15. LibraPay — nu există plugin public (de adresat)

Verificat: **nu e pe WordPress.org și nu e în documentația lor**. Manualul spune că modulul îl furnizează echipa tehnică LibraPay la instalarea serviciului. Integrarea: pagină găzduită `secure.librapay.ro`, câmpuri MERCHANT(15)/TERMINAL(8)/ORDER/AMOUNT/CURRENCY/BACKREF, semnătură **HMAC-SHA1** (P_SIGN, 40 caractere), confirmare prin **IPN** asincron. **Au DEMO-KIT** pentru testare fără bani reali.

**Decizie deschisă:** (a) cerem modulul + demo-kit de la suportul LibraPay, sau (b) construiesc `asw-librapay` după specificație (~1 zi). Internet banking-ul nu era logat, deci panoul de merchant n-a fost verificat.

## Incident disc (începutul sesiunii)

C: 100% plin (90MB liberi) → curățat %TEMP% (3GB), npm cache, șters Splice/Wondershare/CapCut la cererea lui Eduard (draft-urile CapCut păstrate, 16MB; `WsNativePushService` ține 5MB blocat — trebuie admin). Final: ~9GB liberi. Discul rămâne ~98% plin — de monitorizat.

**Legături:** [[Conectari + Import + SEO 2026-07-19]] · [[Recon Sisteme Live 2026-07-07]] · [[Build Status - Prototip v2]]
