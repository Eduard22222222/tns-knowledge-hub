# CoachOS Vault — Claude Code Instructions

Vault dedicat proiectului **CoachOS** (platformă de coaching pentru tenis, partener: Filip).
Convențiile Zettelkasten din vault-ul principal (`OneDrive\Documents\Obsidian Vault\CLAUDE.md`)
se aplică integral aici. Ce e specific:

## Structură
```
CoachOS Vault/
├── CoachOS MOC.md          # entry point — citește-l primul
├── 00-Inbox/               # capturi brute (dump-uri de la Eduard/Filip, meeting notes)
├── Projects/               # scope, roadmap, feature specs
├── Research/               # analize tehnice + de piață (cost models, competiție)
├── Knowledge/              # decizii de arhitectură, GDPR, stack de skills
└── Assets/                 # screenshot-uri, exporturi, diagrame
```

## Reguli specifice acestui proiect

1. **Nu inventa cifre.** Toate estimările de cost (GPU, storage, per-oră-de-video) trebuie să
   aibă sursa notată în paranteză. Dacă un număr e o presupunere, scrie-l ca presupunere.
   Modelul de cost e principalul motiv pentru care există acest vault — dacă îl umpli cu
   numere plauzibile dar neverificate, îl faci inutil.

2. **Separă produsul de feature.** CoachOS (app-ul de coaching) și Video Analytics (pipeline-ul
   de vision) sunt două sisteme cu economii complet diferite. Nu le amesteca în aceeași notă.

3. **Statusul feature-urilor** se ține DOAR în `Projects/CoachOS Roadmap.md`. Nu duplica
   liste de task-uri în alte note — link către roadmap.

4. **Codul** stă în repo, nu aici. Vault-ul ține decizii și *de ce*-uri, nu implementare.

5. Eduard nu citește fișiere `.md` deschise ca text — notele astea sunt pentru Obsidian și
   pentru mine. Livrabilele pentru el se dau ca **text în chat sau PDF/PPTX**.

## Legături în vault-ul principal
Nota-pointer: `Obsidian Vault/Projects/CoachOS Platform.md` → link către acest vault.
