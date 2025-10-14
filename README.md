# 🎟 Plateforme HSE - Projet Informatique CI1A

## 👥 Équipe

Ce dépôt est organisé pour une équipe de trois personnes. Remplacez les noms ci‑dessous par les vôtres :

- **M1** – Chef de projet / Analyste
- **M2** – Développeur Frontend (React)
- **M3** – Développeur Backend (API + Base de données)

## 🌟 Objectif

Développer une plateforme web de gestion Hygiène‑Sécurité‑Environnement (HSE) pour les audits internes et le suivi des anomalies sur les sites OCP. Cette plateforme doit permettre de saisir et de suivre des audits, de gérer des anomalies avec preuves photographiques et de produire des rapports pour les responsables HSE.

## ⚙️ Technologies

Ce projet est organisé selon une architecture **frontend/backend** :

- **Frontend :** React avec Vite, Tailwind CSS et [shadcn/ui](https://ui.shadcn.com) pour l’interface utilisateur.
- **Backend :** Node.js avec Express pour l’API, ou tout autre langage choisi (Java Spring Boot, Python Flask…).
- **Base de données :** MySQL ou Firebase.
- **Outils :** Figma pour la maquette, GitHub pour la gestion de version, Postman pour le test des API.

## 🗂 Structure

Cette organisation propose une séparation claire des différentes parties du projet :

```
plateforme-HSE/
├── backend/              # le serveur (API, logique, base de données)
│   ├── src/             # sources du serveur
│   ├── package.json     # dépendances et scripts Node.js (ou équivalent)
│   └── README.md        # documentation backend
│
├── frontend/             # l’application web React
│   ├── src/             # sources React
│   ├── public/          # fichiers statiques (favicon, index.html…)
│   ├── package.json     # dépendances et scripts front‑end
│   └── README.md        # documentation frontend
│
├── docs/                 # documents et ressources académiques
│   ├── cahier_des_charges.pdf  # cahier des charges fourni par l’équipe projet
│   ├── maquette_figma.png      # capture de la maquette Figma
│   ├── rapport_final.docx      # rapport final à remettre
│   └── diagrammes_UML/         # diagrammes de cas d’utilisation, classes, etc.
│
└── .gitignore             # fichiers à exclure du dépôt
```

## 🚀 Installation rapide

Ce dépôt contient uniquement la structure de base. Pour cloner et commencer à travailler :

```bash
# Cloner le dépôt
git clone https://github.com/<organisation>/plateforme-HSE.git

# Aller dans le projet
cd plateforme-HSE

# Installer les dépendances du frontend (exemple)
cd frontend
npm install

# Lancer l’application React en mode développement (exemple)
npm run dev
```

Adaptez ces commandes en fonction de la technologie backend choisie.

## ✅ Bonnes pratiques

Pour assurer une collaboration fluide :

1. **Travaillez dans des branches dédiées** pour chaque fonctionnalité (ex.: `feature/login-page`).
2. **Rédigez des messages de commit clairs**, en français ou en anglais, en indiquant ce qui a été ajouté/modifié.
3. **Soumettez une Pull Request** lorsque vous avez terminé une tâche et demandez une revue de code avant de fusionner dans `main`.
4. **Documentez** vos choix techniques et les étapes de configuration dans les README des répertoires `backend` et `frontend`.

## 💽 Licence

Ce projet est soumis à la licence MIT. Vous êtes libres de réutiliser et d’adapter ce code tant que vous conservez la notice de copyright et la licence dans les copies ou dérivés.
