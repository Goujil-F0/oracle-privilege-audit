-- 1/Identifier les privilèges sur le schéma HR
SELECT GRANTEE, TABLE_NAME, PRIVILEGE, GRANTABLE 
FROM DBA_TAB_PRIVS 
WHERE OWNER = 'HR';
-- Requête pour identifier les privilèges accordés avec `WITH GRANT OPTION` 
SELECT GRANTEE, TABLE_NAME, PRIVILEGE, GRANTABLE  
FROM DBA_TAB_PRIVS  
WHERE OWNER = 'HR' AND GRANTABLE = 'YES'; 
-- Supposons que vous avez une table nommée `EMPLOYEES` dans le schéma `HR`. 
-- Écrivez une requête pour lister tous les privilèges accordés sur cette table. 
SELECT GRANTEE, PRIVILEGE, GRANTABLE 
FROM DBA_TAB_PRIVS 
WHERE TABLE_NAME = 'EMPLOYEES' 
AND OWNER = 'HR'; 

-- 2/Vérifier les privilèges d'un utilisateur spécifique (USER_A ou OTHMANE)
SELECT OWNER, TABLE_NAME, PRIVILEGE, GRANTABLE 
FROM DBA_TAB_PRIVS 
WHERE GRANTEE = 'USER_TEST_A'; -- Remplacez par 'OTHMANE' si besoin


-- 3/ Identifier les privilèges accordés avec WITH GRANT OPTION
SELECT GRANTEE, OWNER, TABLE_NAME, PRIVILEGE 
FROM DBA_TAB_PRIVS 
WHERE GRANTABLE = 'YES';


-- 4/ Lister les privilèges accordés PAR un utilisateur spécifique
SELECT GRANTEE, TABLE_NAME, PRIVILEGE, GRANTABLE 
FROM DBA_TAB_PRIVS 
WHERE GRANTOR = 'HR';


-- 5/Cas pratique : Accorder et transmettre des droits
------Créer l'utilisateur USER_TEST_A-------
CREATE USER USER_TEST_A IDENTIFIED BY 1234;
------Créer l'utilisateur USER_TEST_B-------
CREATE USER USER_TEST_B IDENTIFIED BY 1234;

------En tant que DBA :
GRANT SELECT ON HR.EMPLOYEES TO USER_TEST_A WITH GRANT OPTION;
------En tant que USER_A (pour tester la transmission) :
GRANT SELECT ON HR.EMPLOYEES TO USER_TEST_B;


-- 6/ Analyse quantitative (Comptage)
------Combien de personnes peuvent lire la table DEPARTMENTS ? -------
SELECT COUNT(DISTINCT GRANTEE) AS NUMBER_OF_USERS 
FROM DBA_TAB_PRIVS 
WHERE OWNER = 'HR' 
  AND TABLE_NAME = 'DEPARTMENTS' 
  AND PRIVILEGE = 'SELECT';

-- 7/ les privilèges accordés à l'utilisateur `USER_B` sur la table `SALARIES` dans le schéma `FINANCE`
SELECT PRIVILEGE, GRANTABLE 
FROM DBA_TAB_PRIVS 
WHERE OWNER = 'FINANCE' AND TABLE_NAME = 'SALARIES' AND GRANTEE = 'USER_B';

-- 8/ privilèges accordés avec l'option `WITH GRANT OPTION` sur des vues dans le schéma `SALES`
SELECT GRANTEE, TABLE_NAME, PRIVILEGE 
FROM DBA_TAB_PRIVS 
WHERE OWNER = 'SALES' AND GRANTABLE = 'YES';