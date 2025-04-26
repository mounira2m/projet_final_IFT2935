# app.py

import tkinter as tk
from tkinter import scrolledtext

from sqlalchemy import distinct, text
from db import engine, Session
from models import Base, Stage, Etudiant, Enseignant, Convention

# 1) Initialisation de la BDD
def init_db():
    # DROP de toutes les tables en cascade
    tables = ["propose","etudiant","stage","departement",
              "entreprise","enseignant","convention"]
    with engine.begin() as conn:
        for t in tables:
            conn.execute(text(f"DROP TABLE IF EXISTS {t} CASCADE"))

    # CREATE via script (on ignore DROP internes et commentaires)
    with engine.begin() as conn:
        txt = open("sql/tableCreation.sql", "r", encoding="utf-8").read()
        for stmt in txt.split(";"):
            stmt = stmt.strip()
            if not stmt or stmt.startswith("--") or "drop table" in stmt.lower():
                continue
            conn.execute(text(stmt))

    # INSERT via script
    with engine.begin() as conn:
        txt = open("sql/dataInsertion.sql", "r", encoding="utf-8").read()
        for stmt in txt.split(";"):
            stmt = stmt.strip()
            if stmt:
                conn.execute(text(stmt))


# 2) Libellés des questions
questions = [
    "1) Lister les stages qui sont encore ouverts.",
    "2) Trouver les étudiants en stage dans un programme en lien avec l'informatique",
    "3) Obtenir les étudiants encadrés par l'enseignant de nom Nguyen",
    "4) Obtenir les enseignants qui encadrent au moins deux étudiants inscrits dans des stages différents"
]


# 3) Exécution et affichage génériques
def run_query_orm(query_fn, title):
    question_label.config(text=title)
    text_area.delete(1.0, tk.END)

    session = Session()
    try:
        query   = query_fn(session)  # on récupère un Query, pas .all()
        results = query.all()        # exécute

        if not results:
            text_area.insert(tk.END, "(Aucun résultat)\n")
            return

        first = results[0]
        # si c'est un objet-mappé SQLAlchemy, il a __table__
        if hasattr(first, "__table__"):
            cols = list(first.__table__.columns.keys())
            header = " | ".join(cols)
            rows = [[getattr(obj, c) for c in cols] for obj in results]

        else:
            # c'est une Row ou tuple => colonnes explicitement sélectionnées
            # on récupère leur nom depuis query.column_descriptions
            cols = [d["name"] for d in query.column_descriptions]
            header = " | ".join(cols)
            rows = [tuple(r) for r in results]

        # affiche
        text_area.insert(tk.END, header + "\n" + "-"*60 + "\n")
        for row in rows:
            text_area.insert(tk.END, " | ".join(str(v) for v in row) + "\n")

    except Exception as e:
        text_area.insert(tk.END, f"Erreur : {e}")
    finally:
        session.close()


# 4) Vos 4 requêtes (toujours retourner un Query)

def q1(session):
    # REQ1 : SELECT s.id_stage, s.intitule_stage
    #        FROM Stage s
    #        LEFT JOIN convention c ON s.id_conv = c.id_conv
    #        WHERE statut_stage = 'Ouvert';
    return session.query(
        Stage.id_stage,
        Stage.intitule_stage
    ).outerjoin(
        Convention, Stage.id_conv == Convention.id_conv
    ).filter(
        Stage.statut_stage == 'Ouvert'
    )

def q2(session):
    # REQ2 : SELECT matricule_et, nom, prenom, programme
    #        FROM Etudiant
    #        WHERE programme ILIKE '%Informatique%';
    return session.query(
        Etudiant.matricule_et,
        Etudiant.nom,
        Etudiant.prenom,
        Etudiant.programme
    ).filter(
        Etudiant.programme.ilike('%Informatique%')
    )

def q3(session):
    # REQ3 : SELECT e.matricule_et, e.nom, e.prenom
    #        FROM Etudiant e
    #        JOIN Enseignant ens ON e.matricule_ens = ens.matricule_ens
    #        WHERE ens.nom = 'Nguyen';
    return session.query(
        Etudiant.matricule_et,
        Etudiant.nom,
        Etudiant.prenom
    ).join(
        Enseignant, Etudiant.matricule_ens == Enseignant.matricule_ens
    ).filter(
        Enseignant.nom == 'Nguyen'
    )

def q4(session):
    # REQ4 : SELECT ens.matricule_ens, ens.nom, ens.prenom
    #        FROM etudiant e
    #        JOIN Enseignant ens ON e.matricule_ens = ens.matricule_ens
    #        GROUP BY ens.matricule_ens, ens.nom, ens.prenom
    #        HAVING COUNT(distinct e.ID_stage) >= 2;
    return session.query(
        Enseignant.matricule_ens,
        Enseignant.nom,
        Enseignant.prenom
    ).join(
        Etudiant, Etudiant.matricule_ens == Enseignant.matricule_ens
    ).group_by(
        Enseignant.matricule_ens,
        Enseignant.nom,
        Enseignant.prenom
    ).having(
        session.query(distinct(Etudiant.id_stage))
                   .filter(Etudiant.matricule_ens == Enseignant.matricule_ens)
                   .count() >= 2
    )




# 5) Handlers
def question1(): run_query_orm(q1, questions[0])
def question2(): run_query_orm(q2, questions[1])
def question3(): run_query_orm(q3, questions[2])
def question4(): run_query_orm(q4, questions[3])


# 6) Interface Tkinter
root = tk.Tk()
root.title("Réponses aux 4 requêtes")

question_label = tk.Label(
    root, text="", font=("Arial", 12, "bold"), anchor="w"
)
question_label.grid(
    row=0, column=0, columnspan=4,
    sticky="we", padx=10, pady=(10,0)
)

text_area = scrolledtext.ScrolledText(root, width=90, height=18)
text_area.grid(row=1, column=0, columnspan=4, padx=10, pady=10)

for i, cmd in enumerate([question1, question2, question3, question4], start=0):
    tk.Button(root,
              text=f"Question {i+1}",
              command=cmd,
              width=20)\
      .grid(row=2, column=i, padx=5, pady=5)


# 7) Point d'entrée
if __name__ == "__main__":
    init_db()      # crée + peuple la BDD
    root.mainloop()  # lance la GUI
