EXPLAIN ANALYZE
SELECT *
FROM commandes
WHERE
    statut = 'LIVREE'
    AND YEAR(date_commande) = 2026
ORDER BY montant_total DESC
LIMIT 10;