CREATE INDEX idx_cmd_date ON commandes (date_commande);

EXPLAIN ANALYZE
SELECT
    id,
    client_id,
    date_commande,
    statut,
    montant_total
FROM commandes
WHERE
    statut = 'LIVREE'
    AND date_commande >= '2026-01-01'
    AND date_commande < '2027-01-01'
ORDER BY montant_total DESC;