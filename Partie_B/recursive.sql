
WITH RECURSIVE organigramme AS (
    -- 1. Ancre : la CTO (racine)
    SELECT 
        id,
        nom,
        manager_id,
        departement,
        1 AS niveau,
        CAST(nom AS CHAR(500)) AS chemin
    FROM employes
    WHERE manager_id IS NULL

    UNION ALL

-- 2. Récursion : les subordonnés directs
SELECT 
        e.id,
        e.nom,
        e.manager_id,
        e.departement,
        o.niveau + 1 AS niveau,
        CAST(CONCAT(o.chemin, ' > ', e.nom) AS CHAR(500)) AS chemin
    FROM employes e
    JOIN organigramme o ON e.manager_id = o.id
    WHERE o.niveau < 20
)
SELECT niveau, chemin, nom, departement
FROM organigramme
ORDER BY niveau ASC, departement ASC;