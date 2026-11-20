-- ------------------------------------------------------------------------------
-- 1. CHOIX DES TECHNOLOGIES ET THEOREMES (CAP / PACELC)
-- ------------------------------------------------------------------------------

-- (a) Suivi GPS temps réel (30 000 véhicules toutes les 3s)
-- Base       : Colonnes larges / Time-Series
-- Theoreme   : CAP = AP | PACELC = PA/EL (priorite a la disponibilite et faible latence)
-- Pourquoi   : 10 000 ecritures/seconde en continu, ecriture append-only sans verrou.
--              Partitionnement par (vehicule_id, jour).
--              Une coherence eventuelle suffit (perdre 1 point GPS n'est pas grave).

-- (b) Facturation bancaire des trajets
-- Base       : Relationnelle SQL (PostgreSQL ou MySQL InnoDB)
-- Theoreme   : CAP = CP | PACELC = PC/EC (priorite a la coherence stricte)
-- Pourquoi   : Transactions ACID obligatoires (pas de double debit, pas d'argent perdu).
--              Cles primaires, cles etrangeres et integrite financiere.

-- (c) Amis communs a 3 degres de separation
-- Base       : Orientee Graphe (Neo4j)
-- Theoreme   : Specialisation structurelle
-- Pourquoi   : Traversee des liens d'amitie en memoire en O(1) par saut.
--              Evite 3 auto-jointures SQL explosives en O(N^3) qui bloqueraient le serveur.

-- ------------------------------------------------------------------------------
-- 2. JUSTIFICATION SELON LES 4 CRITERES DE CHOIX
-- ------------------------------------------------------------------------------

-- 1. Volume et debit d'acces :
--    - GPS : Enorme flux d'ecriture  encaisse parfaitement par Cassandra.
--    - Facturation : Moins de volume mais transactions critiques avec verrous.
--    - Graphe : Lectures profondes instantanees via pointeurs memoire.

-- 2. Niveau de coherence :
--    - GPS : Coherence eventuelle toleree.
--    - Facturation : Coherence immediate et absolue obligatoire (ACID).
--    - Graphe : Coherence causale pour voir les relations d'amitie.

-- 3. Structure des donnees :
--    - GPS : Donnees temporelles plates (id, timestamp, position, vitesse).
--    - Facturation : Donnees relationnelles et formalisees (trajets, factures, comptes).
--    - Graphe : Reseau de noeuds (Utilisateurs) et d'aretes (AMI_AVEC).

-- 4. Requetes cibles :
--    - Cassandra : Requetes directes par cle (vehicule_id + date).
--    - PostgreSQL : Calculs comptables, regles d'integrite.
--    - Neo4j : Requetes Cypher de chemins (ex: MATCH (u)-[:AMI*3]-(ami)).