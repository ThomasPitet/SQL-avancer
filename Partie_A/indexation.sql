CREATE MATERIALIZED VIEW mv_synthese_segments AS
SELECT c.segment, COUNT(cm.id) AS nb_commandes, ROUND(SUM(cmd.montant_total), 2) AS ca_total
FROM commandes cmd
    JOIN clients c ON c.id = cmd.client_id
GROUP BY
    c.segment

SELECT * FROM mv_synthese_segments;

INSERT INTO
    commandes (
        client_id,
        date_commande,
        statut,
        montant_total
    )
VALUES (
        1,
        '2026-11-20 10:00:00',
        'LIVREE',
        9999.00
    );