# models.py
from sqlalchemy import (
    Column, Integer, String, Date, Text,
    ForeignKey, CheckConstraint
)
from sqlalchemy.orm import declarative_base, relationship

Base = declarative_base()

class Convention(Base):
    __tablename__ = "convention"
    id_conv     = Column("id_conv", Integer, primary_key=True)
    d_signature = Column("d_signature", Date, nullable=False)
    stages      = relationship("Stage", back_populates="convention")

class Enseignant(Base):
    __tablename__ = "enseignant"
    matricule_ens = Column("matricule_ens", Integer, primary_key=True)
    nom           = Column("nom", String(100), nullable=False)
    prenom        = Column("prenom", String(100), nullable=False)
    email_ens     = Column("email_ens", String(150), nullable=False, unique=True)
    faculte       = Column("faculte", String(100))
    etudiants     = relationship("Etudiant", back_populates="encadrant")

class Stage(Base):
    __tablename__ = "stage"
    id_stage       = Column("id_stage", Integer, primary_key=True)
    intitule_stage = Column("intitule_stage", Text, nullable=False)
    date_debut     = Column("date_debut", Date, nullable=False)
    date_fin       = Column("date_fin", Date, nullable=False)
    statut_stage   = Column(
        "statut_stage", String(20),
        CheckConstraint("statut_stage IN ('Ouvert','Fermé','En cours','Annulé')")
    )
    id_conv        = Column("id_conv", Integer, ForeignKey("convention.id_conv"))
    convention     = relationship("Convention", back_populates="stages")
    etudiants      = relationship("Etudiant", back_populates="stage")

class Etudiant(Base):
    __tablename__ = "etudiant"
    matricule_et   = Column("matricule_et", Integer, primary_key=True)
    nom            = Column("nom", String(100), nullable=False)
    prenom         = Column("prenom", String(100), nullable=False)
    email_et       = Column("email_et", String(150), nullable=False, unique=True)
    date_naissance = Column("date_naissance", Date, nullable=False)
    programme      = Column("programme", String(100))
    nb_credits     = Column("nb_credits", Integer, CheckConstraint("nb_credits >= 0"))
    session_stage  = Column("session_stage", String, nullable=False)
    annee_stage    = Column("annee_stage", Integer, nullable=False)
    id_stage       = Column("id_stage", Integer, ForeignKey("stage.id_stage"))
    matricule_ens  = Column("matricule_ens", Integer, ForeignKey("enseignant.matricule_ens"))

    stage     = relationship("Stage", back_populates="etudiants")
    encadrant = relationship("Enseignant", back_populates="etudiants")
