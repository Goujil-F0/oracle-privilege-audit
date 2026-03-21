-- Créer la table commandes
CREATE TABLE commandes (
    id_commande NUMBER PRIMARY KEY,
    date_commande DATE,
    montant NUMBER(10,2),
    id_employe NUMBER,
    CONSTRAINT fk_employe FOREIGN KEY (id_employe) 
    REFERENCES employees(employee_id)
);
-- Insertions février 2026
INSERT INTO commandes VALUES (1, TO_DATE('05/02/2026', 'DD/MM/YYYY'), 1500.00, 100);
INSERT INTO commandes VALUES (2, TO_DATE('10/02/2026', 'DD/MM/YYYY'), 2300.50, 101);
INSERT INTO commandes VALUES (3, TO_DATE('15/02/2026', 'DD/MM/YYYY'), 800.75, 102);
INSERT INTO commandes VALUES (4, TO_DATE('20/02/2026', 'DD/MM/YYYY'), 3200.00, 103);
INSERT INTO commandes VALUES (5, TO_DATE('25/02/2026', 'DD/MM/YYYY'), 950.25, 104);

-- Insertions mars 2026
INSERT INTO commandes VALUES (6, TO_DATE('02/03/2026', 'DD/MM/YYYY'), 1750.00, 105);
INSERT INTO commandes VALUES (7, TO_DATE('08/03/2026', 'DD/MM/YYYY'), 4200.00, 106);
INSERT INTO commandes VALUES (8, TO_DATE('15/03/2026', 'DD/MM/YYYY'), 620.50, 107);
INSERT INTO commandes VALUES (9, TO_DATE('20/03/2026', 'DD/MM/YYYY'), 2800.00, 108);
INSERT INTO commandes VALUES (10, TO_DATE('25/03/2026', 'DD/MM/YYYY'), 1100.75, 109);

-- Valider les insertions
COMMIT;

SELECT * FROM commandes;

-- Vérifier l'integrite referentielle en essayant d'inserer une cmd avec un employé qui n'existe pas
INSERT INTO commandes VALUES (11, TO_DATE('01/03/2026', 'DD/MM/YYYY'), 500.00, 9999);