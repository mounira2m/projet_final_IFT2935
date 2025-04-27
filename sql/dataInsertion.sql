--INSERTION DANS LES TABLES

INSERT INTO convention (ID_conv, d_signature) VALUES
(3000, '2020-12-31'),
(3001, '2024-12-25'),
(3002, '2025-09-05'),
(3003, '2025-01-10'),
(3004, '2023-04-25'),
(3005, '2025-08-31'),
(3006, '2024-01-05'),
(3007, '2025-01-05'),
(3008, '2022-08-22'),
(3009, '2024-12-26'),
(3010, '2025-04-30'),
(3011, '2025-08-31');


INSERT INTO entreprise (id_entreprise, nom_entrp, num_rue, rue, ville, province, code_postal, courriel_entrp, tel_entrp) VALUES
(293, 'TechnoPlus', '200', 'rue Sainte-Catherine', 'Montréal', 'QC', 'H00X00', 'technoplus@company.ca', '5145551000'),
(384, 'InnovaLab', '201', 'boulevard Saint-Laurent', 'Laval', 'QC', 'H01X01', 'innovalab@company.ca', '5145551001'),
(924, 'BioPharma', '202', 'avenue du Parc', 'Québec', 'QC', 'H02X02', 'biopharma@company.ca', '5145551002'),
(343, 'GreenIT', '203', 'rue Sherbrooke', 'Gatineau', 'QC', 'H03X03', 'greenit@company.ca', '5145551003'),
(741, 'Softdev Inc.', '204', 'rue Saint-Denis', 'Sherbrooke', 'QC', 'H04X04', 'softdevinc.@company.ca', '5145551004'),
(667, 'AéroTech', '205', 'rue Rachel', 'Longueuil', 'QC', 'H05X05', 'aérotech@company.ca', '5145551005'),
(451, 'LogiCom', '206', 'boulevard René-Lévesque', 'Trois-Rivières', 'QC', 'H06X06', 'logicom@company.ca', '5145551006'),
(841, 'VisionWare', '207', 'avenue Laurier', 'Saguenay', 'QC', 'H07X07', 'visionware@company.ca', '5145551007'),
(869, 'CyberGen', '208', 'rue Beaubien', 'Terrebonne', 'QC', 'H08X08', 'cybergen@company.ca', '5145551008'),
(711, 'NeoTech', '209', 'rue Masson', 'Lévis', 'QC', 'H09X09', 'neotech@company.ca', '5145551009'),
(500, 'DataVision', '210', 'boulevard Pie-IX', 'Drummondville', 'QC', 'H10X10', 'datavision@company.ca', '5145551010'),
(501, 'PixelCorp', '211', 'rue Notre-Dame', 'Repentigny', 'QC', 'H11X11', 'pixelcorp@company.ca', '5145551011');


INSERT INTO enseignant (matricule_ens, nom, prenom, email_ens, faculte) VALUES
(7001, 'Diallo', 'Fatoumata', 'fatoumata.diallo@umontreal.ca', 'Sciences'),
(7002, 'Nguyen', 'Minh', 'minh.nguyen@umontreal.ca', 'Informatique'),
(7003, 'Martinez', 'Camila', 'camila.martinez@umontreal.ca', 'Administration'),
(7004, 'Traoré', 'Moussa', 'moussa.traore@umontreal.ca', 'Bio-Informatique'),
(7005, 'Gagnon', 'Marie', 'marie.gagnon@umontreal.ca', 'Mathématiques'),
(7006, 'Chen', 'Li', 'li.chen@umontreal.ca', 'Informatique'),
(7007, 'Ouellet', 'Nadia', 'nadia.ouellet@umontreal.ca', 'Mathématiques'),
(7008, 'Rahman', 'Ali', 'ali.rahman@umontreal.ca', 'Informatique'),
(7009, 'Diakite', 'Abdoulaye', 'abdoulaye.Diakite@umontreal.ca', 'Mathématiques'),
(7010, 'Smith', 'John', 'john.smith@umontreal.ca', 'Informatique'),
(7011, 'Morales', 'Lucia', 'lucia.morales@umontreal.ca', 'Génie logiciel'),
(7012, 'Leclerc', 'Vincent', 'vincent.leclerc@umontreal.ca', 'Sciences de la santé');


INSERT INTO stage (id_stage, intitule_stage, date_debut, date_fin, statut_stage, id_conv) VALUES
(1000, 'Cybersécurité', '2021-01-10', '2021-04-10', 'Ouvert', 3000),
(1001, 'Développement Web', '2025-01-04', '2025-04-30', 'En cours', 3001),
(1002, 'Intelligence Artificielle', '2025-09-15', '2025-12-15', 'Ouvert', 3002),
(1003, 'Réseaux Informatiques', '2025-01-20', '2025-04-20', 'Fermé', 3003),
(1004, 'Systèmes embarqués', '2023-05-05', '2023-08-05', 'Ouvert', 3004),
(1005, 'Analyse de données', '2025-09-10', '2025-12-10', 'Fermé', 3005),
(1006, 'Sécurité des réseaux', '2024-01-15', '2024-04-15', 'Ouvert', 3006),
(1007, 'Déploiement Cloud', '2025-01-15', '2025-05-15', 'En cours', 3007),
(1008, 'Applications mobiles', '2022-09-01', '2022-12-01', 'Ouvert', 3008),
(1009, 'Big Data', '2025-01-05', '2025-04-05', 'Fermé', 3009),
(1010, 'Blockchain', '2025-05-10', '2025-08-10', 'Ouvert', 3010),
(1011, 'Informatique quantique', '2025-09-10', '2025-12-10', 'Fermé', 3011),
(1012, 'DevOps', '2025-06-01', '2025-09-01', 'Ouvert', 3002),
(1013, 'Machine Learning', '2025-10-01', '2025-01-01', 'Ouvert', 3003);



INSERT INTO propose (id_entreprise, id_stage) VALUES
(293, 1000),
(384, 1001),
(924, 1002),
(343, 1003),
(741, 1004),
(667, 1005),
(451, 1006),
(841, 1007),
(869, 1008),
(711, 1009),
(500, 1010),
(501, 1011);


INSERT INTO departement (num_departement, nom_departement, id_entreprise) VALUES
(300, 'Informatique', 293),
(301, 'Développement durable', 384),
(302, 'Pharmaceutique', 924),
(303, 'TI & Innovation', 343),
(304, 'Logiciels', 741),
(305, 'Aéronautique', 667),
(306, 'Support client', 451),
(307, 'Recherche', 841),
(308, 'Cybersécurité', 869),
(309, 'Big Data', 711),
(310, 'Technologie Santé', 500),
(311, 'Multimédia', 501);


INSERT INTO etudiant  (matricule_et, nom, prenom, date_naissance , email_Et, programme, nb_credits, annee_stage, session_stage, ID_stage, matricule_ens) VALUES
(2048401, 'Tremblay', 'Alexandre', '2002-01-02', 'alexandre.tremblay@umontreal.ca', 'Baccalauréat en Mathématiques', 54, 2025, 'Hiver', 1003, 7001),
(2048402, 'Nguyen', 'Thierry', '1999-05-03', 'thierry.nguyen@umontreal.ca', 'Mineure en Informatique', 69, 2023, 'Automne', 1001, 7002),
(2048403, 'Gagnon', 'Sophie', '2000-03-04', 'sophie.gagnon@umontreal.ca', 'Majeure en administration', 81, 2025, 'Hiver', 1004, 7009),
(2048404, 'Ouedraogo', 'Isabelle', '2000-01-05', 'isabelle.ouedraogo@umontreal.ca', 'Baccalauréat en Bio-Informatique', 75, 2025, 'Hiver', 1006, 7009),
(2048405, 'Roy', 'Louis', '2002-01-06', 'louis.roy@umontreal.ca', 'Baccalauréat en Mathématiques', 90, 2024, 'Été', 1010, 7005),
(2048406, 'Côté', 'Nadia', '2000-11-07', 'nadia.côte@umontreal.ca', 'Baccalauréat en Informatique', 31, 2022, 'Hiver', 1002, 7006),
(2048407, 'Morin', 'Émilie', '1998-07-08', 'emilie.morin@umontreal.ca', 'Baccalauréat en Mathématiques', 57, 2023, 'Hiver', 1000, 7007),
(2048408, 'Ben', 'Rahman', '2000-01-09', 'rahman.ben@umontreal.ca', 'Majeure en Informatique', 53, 2025, 'Été', 1005, 7008),
(2048409, 'Diakite', 'Karine', '2005-04-10', 'karine.Diakite@umontreal.ca', 'Mineure en Mathématiques', 31, 2025, 'Hiver', 1011, 7009),
(2048410, 'Pelletier', 'Hugo', '2000-09-11', 'hugo.pelletier@umontreal.ca', 'Majeure en Mathématiques et Informatique', 31, 2025, 'Automne', 1007, 7009),
(2048411, 'Chénier', 'Amélie', '2001-12-01', 'amelie.chenier@umontreal.ca', 'Génie logiciel', 72, 2025, 'Hiver', 1008, 7011),
(2048412, 'Leclerc', 'Julien', '2004-03-15', 'julien.leclerc@umontreal.ca', 'Sciences de la santé', 84, 2021, 'Été', 1009, 7012),
(2048413, 'Lévesque', 'Thomas', '2001-05-22', 'thomas.levesque@umontreal.ca', 'Baccalauréat en Informatique', 60, 2025, 'Hiver', 1012, 7006),
(2048414, 'Marchand', 'Julie', '1999-08-15', 'julie.marchand@umontreal.ca', 'Majeure en Informatique', 75, 2025, 'Été', 1013, 7008),
(2048416, 'Fortin', 'Maxime', '2001-06-18', 'maxime.fortin@umontreal.ca', 'Baccalauréat en Informatique', 78, 2025, 'Été', 1007, 7010),
(2048417, 'Bergeron', 'Laurie', '2000-07-25', 'laurie.bergeron@umontreal.ca', 'Baccalauréat en Informatique', 66, 2025, 'Automne', 1010, 7010);
