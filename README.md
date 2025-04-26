# projet_final_IFT2935

## Présentation
Cette application exécute et affiche quatre requêtes prédéfinies sur une base de données PostgreSQL via une interface graphique Tkinter.

## Technologies

- Python 3.7+
- Tkinter (interface graphique)
- SQLAlchemy (ORM)
- PostgreSQL (SGBD)

---

## Structure du projet

```
projet/
├── app.py            # Point d’entrée : initialise la BDD et lance la GUI
├── db.py             # Configuration SQLAlchemy (engine + Session)
├── models.py         # Définition des classes-mappages (ORM)
├── config.py         # Informations de connexion PostgreSQL
└── sql/
    ├── tableCreation.sql   # Script de création des tables
    ├── dataInsertion.sql   # Script de peuplement des données
    └── query.sql           # Requêtes SQL d’origine (référence)
```

---

## Installation

1. Cloner ou copier ce projet.
2. Installer les dépendances :
   ```bash
   pip install sqlalchemy psycopg2-binary
   ```
3. Configurer la connexion PostgreSQL dans **config.py** :
   ```python
   DB_HOST     = "localhost"
   DB_PORT     = 5432
   DB_NAME     = "votre_db"
   DB_USER     = "votre_user"
   DB_PASSWORD = "votre_mot_de_passe"
   ```

---

## Lancement

Dans le terminal, à la racine du projet :
```bash
python app.py
```
Cette seule commande effectuera :
1. Suppression des tables existantes
2. Création des tables à partir de `tableCreation.sql`
3. Insertion des données via `dataInsertion.sql`
4. Ouverture de la fenêtre Tkinter

---

## Guide utilisateur

Au lancement, une fenêtre s’affiche avec :

- **Libellé de question** (en haut) : indique la requête active
- **Zone de texte** : affiche les résultats formatés
- **4 boutons** :
  1. **Question 1** : stages encore ouverts
  2. **Question 2** : étudiants en programme « Informatique »
  3. **Question 3** : étudiants encadrés par « Nguyen »
  4. **Question 4** : enseignants encadrant au moins deux étudiants dans des stages différents

**Utilisation** : cliquer sur le bouton correspondant à la requête souhaitée pour voir immédiatement les résultats.

---

## Personnalisation

- **Ajouter ou modifier une requête** : éditer les fonctions `q1()`…`q4()` dans **app.py**.
- **Mettre à jour le schéma ou les données** : modifier les scripts SQL dans le dossier **sql/**.

---

## Fonctionnement interne

- `init_db()` : gère la création et le peuplement en transaction
- `run_query_orm()` : exécute une requête SQLAlchemy et formate l’affichage
- Les classes SQLAlchemy de **models.py** assurent la correspondance avec les tables PostgreSQL

---

## Références

- [SQLAlchemy ORM](https://docs.sqlalchemy.org/)
- [Tkinter](https://docs.python.org/3/library/tkinter.html)
- [psycopg2](https://www.psycopg.org/)

