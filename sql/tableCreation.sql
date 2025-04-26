--CREATION DES TABLES

drop table etudiant cascade;
drop table Stage cascade;


CREATE TABLE Convention (
    ID_Conv int PRIMARY KEY,
    D_Signature DATE NOT NULL
);

CREATE TABLE Enseignant (
    matricule_ens INT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email_ens VARCHAR(150) UNIQUE NOT NULL,
    faculte VARCHAR(100)
);

CREATE TABLE Entreprise (
    ID_Entreprise int PRIMARY KEY,
    nom_entrp VARCHAR(100) NOT NULL,
	num_Rue VARCHAR(10),
	rue VARCHAR(100),
	ville VARCHAR(50),
	province VARCHAR(10),
	code_postal VARCHAR(6),
	courriel_entrp VARCHAR(150),
    tel_entrp VARCHAR(20)
);


CREATE TABLE Departement (
    num_departement int PRIMARY KEY,
    nom_departement VARCHAR(100) NOT null,
    ID_Entreprise int,
    foreign key (ID_Entreprise) references Entreprise(ID_Entreprise)
);


CREATE TABLE Stage (
    ID_Stage int PRIMARY KEY,
    intitule_Stage text not null,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    statut_stage VARCHAR(20)
        CHECK (Statut_stage IN ('Ouvert', 'Fermé', 'En cours', 'Annulé')),
    ID_Conv int,
    foreign key (ID_Conv) references Convention(ID_Conv)
    
);


CREATE TABLE Etudiant (
    matricule_Et int PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email_Et VARCHAR(150) UNIQUE NOT NULL,
    date_naissance DATE NOT NULL,
    programme VARCHAR(100),
    nb_Credits INT CHECK (Nb_Credits >= 0),
    session_stage text not null,
    annee_stage int not null,
    ID_Stage int,
    matricule_ens int,
    foreign key (ID_Stage) references Stage(ID_Stage),
    foreign key (matricule_ens) references Enseignant(matricule_ens)

);


CREATE TABLE Propose (
	ID_Entreprise int,
	ID_Stage int,
	foreign key (ID_Entreprise) references Entreprise(ID_Entreprise),
	foreign key (ID_Stage) references Stage(ID_Stage)
);