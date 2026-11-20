CREATE MATERIALIZED VIEW mv_synthese_segments AS
SELECT c.segment, COUNT(cm.id) AS nb_commandes, ROUND(SUM(cmd.montant_total), 2) AS ca_total
FROM commandes cmd
    JOIN clients c ON c.id = cmd.client_id
GROUP BY
    c.segment