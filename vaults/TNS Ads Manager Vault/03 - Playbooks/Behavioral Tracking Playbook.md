# Playbook: Behavioral Tracking (GTM + GA4) pentru optimizare campanii + UX

**Scop:** Layer separat de tracking ÎN PLUS de conversiile principale (`generate_lead`) — capturează detaliu pe **care** CTA / link / secțiune generează engagement, ca să optimizăm:
1. Plasarea butoanelor pe site (UX)
2. Mesajul / ad copy în Google Ads (care funcționează cu cei care sună)
3. Targeting (cine scrollează 75%+ și sună vs. cei care bounce)

**Prioritate evenimente (importanță descrescătoare):**
1. `phone_click` — apeluri (cea mai importantă conversie pentru servicii locale)
2. `whatsapp_click` — alt canal de booking
3. `service_interest` — interes pe servicii specifice (semnal puternic de intenție)
4. `nav_click` — pe ce secțiune dă click userul (UX heatmap)
5. `social_follow` — brand awareness
6. `scroll_depth` — engagement / quality of traffic
7. `time_engaged` — timp petrecut pe site

---

## Convenție denumire tags

```
GA4 Event — {event_name}              # conversion / primary (ex: Apel telefon)
GA4 Event — {event_name} (behavioral) # behavioral layer pentru același trigger
GA4 Event — {event_name}              # behavioral only (ex: nav_click)
```

Tag-urile `(behavioral)` NU sunt conversii — sunt event-uri analytics pure.

---

## 1. Variabile Built-in necesare (Variables → Configure)

Activează în GTM:
- ✅ Click Element
- ✅ Click Text
- ✅ Click URL
- ✅ Click Classes
- ✅ Click ID
- ✅ Page URL
- ✅ Scroll Depth Threshold
- ✅ Scroll Depth Units
- ✅ Form Element (dacă există formulare)
- ✅ Form ID
- ✅ Form Text

---

## 2. Triggere de creat

### Click — Nav Menu
```
Type: Click - All Elements
Fires on: Some Clicks
Condition: Click Text matches RegEx {Servicii|Prețuri|Info|Contact|Rezervă}  
                                       (înlocuiește cu menu items reali ai clientului)
```

### Click — Service Interest
```
Type: Click - All Elements
Fires on: Some Clicks
Condition: Click Text matches RegEx Detalii|Serviciile|Vezi Toate|Află mai mult
```

### Click — Social
```
Type: Click - Just Links
Fires on: Some Link Clicks
Condition: Click URL matches RegEx facebook|instagram|tiktok|youtube|linkedin
```

### Scroll Depth 25-90
```
Type: Scroll Depth
Vertical Scroll Depths: 25, 50, 75, 90 (Percentages)
Fires on: All Pages
```

### Timer 30s
```
Type: Timer
Event Name: gtm.timer
Interval: 30000 (ms)
Limit: 1 (fire once)
Condition: Page URL contains {domain}
Fires on: All Timers
```

### Timer 60s
```
Same as Timer 30s but Interval: 60000
```

### Click — Telefon (deja existent în orice setup)
```
Type: Click - Just Links
Condition: Click URL contains tel:
```

### Click — WhatsApp (deja existent)
```
Type: Click - Just Links
Condition: Click URL contains wa.me
```

---

## 3. Tags de creat (GA4 Event)

**Toate tag-urile au:** Tag Type `Google Analytics: GA4 Event` + Measurement ID `G-XXXXXXXXXX` (al clientului).

### Tag: GA4 Event — phone_click (behavioral)
```
Event Name: phone_click
Event Parameters:
  button_label = {{Click Text}}    ← Care buton din pagină a fost clickuit
Trigger: Click — Telefon
```
**De ce:** Vezi dacă "Sună acum" vs "Rezervă apel" vs "+40770..." din header / hero / footer generează mai multe apeluri.

### Tag: GA4 Event — whatsapp_click (behavioral)
```
Event Name: whatsapp_click
Event Parameters:
  button_label = {{Click Text}}
Trigger: Click — WhatsApp
```

### Tag: GA4 Event — nav_click
```
Event Name: nav_click
Event Parameters:
  section = {{Click Text}}
Trigger: Click — Nav Menu
```

### Tag: GA4 Event — service_interest
```
Event Name: service_interest
Event Parameters:
  service_name = {{Click Text}}
Trigger: Click — Service Interest
```

### Tag: GA4 Event — social_follow
```
Event Name: social_follow
Event Parameters:
  platform = {{Click Text}}   (sau {{Click URL}} dacă text-ul nu e descriptiv)
Trigger: Click — Social
```

### Tag: GA4 Event — scroll_depth
```
Event Name: scroll_depth
Event Parameters:
  depth_threshold = {{Scroll Depth Threshold}}
Trigger: Scroll Depth 25-90
```

### Tag: GA4 Event — time_engaged 30s
```
Event Name: time_engaged
Event Parameters:
  seconds = 30
Trigger: Timer 30s
```

### Tag: GA4 Event — time_engaged 60s
```
Event Name: time_engaged
Event Parameters:
  seconds = 60
Trigger: Timer 60s
```

---

## 4. GA4 — Custom Definitions (Admin → Custom definitions)

Pentru ca parametrii să apară în rapoarte ca dimensions, marcăm fiecare ca **Custom dimension** în GA4:

| Parameter | Scope | Dimension name |
|---|---|---|
| `button_label` | Event | Button Label |
| `section` | Event | Nav Section |
| `service_name` | Event | Service Name |
| `platform` | Event | Social Platform |
| `depth_threshold` | Event | Scroll Depth |
| `seconds` | Event | Time Engaged Seconds |

⚠️ După ce marchezi custom dimensions, datele apar în rapoarte după ~24h.

---

## 5. Cum se folosesc datele în optimizare

### Pentru Google Ads
- **Compare CPL pe button_label:** Care CTA din hero generează cele mai multe apeluri? Mută acel text în ad copy.
- **Audience custom:** "Engaged users" = scroll_depth ≥ 75% OR time_engaged ≥ 60s. Folosește ca audience similar / remarketing.
- **Negative audiences:** Useri cu doar `session_start` și fără `scroll_depth` ≥ 25% — probabil traffic de calitate scăzută, exclude.

### Pentru website (UX)
- **Heatmap-like:** GA4 → Engagement → Events → filter `nav_click` → group by `section`. Vezi care item de meniu e clickuit cel mai mult.
- **Service ranking:** filter `service_interest` → group by `service_name`. Reordonează serviciile pe pagină de la cel mai clickuit la cel mai puțin.
- **Funnel:** Cum scade engagement-ul de la `scroll_depth=25` → `50` → `75` → `90`? Drop mare la 50 = secțiunea de la 50% e plictisitoare.

### Reports recomandate (GA4 → Explore → Free form)
1. **Phone CTA performance:** rows=`button_label`, metric=`Event count` (filter `event_name = phone_click`)
2. **Service interest ranking:** rows=`service_name`, metric=`Event count` (filter `event_name = service_interest`)
3. **Engagement quality:** rows=`Session source / medium`, metrics=`scroll_depth count` + `time_engaged count` — vezi care surse aduc useri calitativi.

---

## 6. Checklist setup pentru client nou

- [ ] Variabile built-in activate (vezi §1)
- [ ] 5+3 triggere create (8 total: 5 noi + 3 existente din Tracking Setup)
- [ ] 7 tags behavioral GA4 Event create
- [ ] Numele variabilelor în UI corespund cu ce e pe site-ul real al clientului (RegEx menu items!)
- [ ] Tag-urile au Measurement ID corect (al clientului, nu al alt client!)
- [ ] Publish version cu Description detaliată
- [ ] Verifică în GA4 DebugView că event-urile vin cu parametri
- [ ] Adaugă custom dimensions în GA4 Admin
- [ ] Așteaptă 24h, verifică rapoarte
- [ ] Configurează 2-3 exploration reports pre-built pentru client

---

## 7. Naming convention pentru reutilizare

Toate denumirile tag-urilor/triggerelor sunt CASE-SENSITIVE în GTM și conțin caracterul **em-dash** `—` (Alt+0151), NU minus `-`.

Format standard:
- Triggere: `Click — {target}`, `Scroll Depth {range}`, `Timer {seconds}s`
- Tags: `GA4 Event — {event_name}` sau `GA4 Event — {event_name} ({suffix})`

Aceasta menține lista alfabetică ordonată în GTM și ușor de scanat vizual.

---

## 8. Costuri și considerații

- ✅ GA4 + GTM = gratuit
- ✅ Event-urile behavioral NU consumă cota Google Ads
- ⚠️ Nu marca event-urile behavioral ca **Key Events** în GA4 — altfel se importă în Google Ads ca conversii și diluează semnalul Smart Bidding
- ⚠️ Doar `generate_lead` (apel + WhatsApp) rămâne Key Event → import în Google Ads
- ✅ Total event-uri/lună estimat pentru 1k vizite: ~8000 events (sub limita gratuită GA4 de 50M/lună)

---

## 9. Implementare standard pentru clienți noi (workflow rapid)

1. Verifică Tracking Setup Playbook completat (GTM + GA4 + conversion `generate_lead`)
2. Clonează acest playbook
3. Înlocuiește RegEx-urile în triggers cu menu items reali ai clientului
4. Înlocuiește Measurement ID cu cel al clientului
5. Creează triggers (în ordine: Nav, Service, Social, Scroll, Timer 30, Timer 60)
6. Creează tags (în ordine: phone, whatsapp, nav, service, social, scroll, time x2)
7. Verifică Workspace Changes count = ~18 (5 triggers + 7+2 tags noi)
8. Publish
9. Custom dimensions în GA4
10. Așteaptă 24-48h apoi configurează rapoarte

**Timp estimat per client:** ~45 min după ce ai workflow-ul stabilit.

---

## 10. Capcane evitate (lessons learned)

- **Operator "matches RegEx" în GTM:** dropdown-ul nu se deschide întotdeauna pe click. Folosește tastatura: focus pe combobox → săgeți Jos.
- **Form save eșuat = "Discard Changes" dialog:** însemnă că Save a fost dezactivat din lipsă de valoare validă. Verifică warning "Invalid filter specified" sub câmp înainte de Save.
- **Tab key după typing în trigger value:** mută focusul în afara formularului și triggerează "Unsaved Changes". NU presa Tab după ultimul input — click direct pe Save.
- **Em-dash `—` vs minus `-`:** dacă naming-ul e inconsistent, lista nu se sortează cum trebuie. Standardizează em-dash peste tot.
