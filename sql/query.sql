-- ## REQ1
SELECT s.id_stage, s.intitule_stage
FROM Stage s
left join convention c on s.id_conv = c.id_conv
WHERE statut_stage = 'Ouvert';

-- ## REQ2
SELECT matricule_et, nom, prenom, programme
  FROM Etudiant
 WHERE programme ILIKE '%Informatique%';

-- ## REQ3
SELECT e.matricule_et, e.nom, e.prenom
  FROM Etudiant e
  JOIN Enseignant ens ON e.matricule_ens = ens.matricule_ens
 WHERE ens.nom = 'Diakite';

-- ## REQ4
SELECT ens.matricule_ens, ens.nom, ens.prenom --COUNT(p.id_stage) AS nb_stages
  FROM etudiant e
  JOIN Enseignant ens ON e.matricule_ens = ens.matricule_ens
 GROUP BY ens.matricule_ens, ens.nom, ens.prenom
HAVING COUNT(distinct e.ID_stage) >= 2;
