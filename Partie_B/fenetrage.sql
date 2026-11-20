WITH
    classement_produits AS (
        SELECT
            p.id AS produit_id,
            p.nom AS produit_nom,
            c.nom AS categorie_nom,
            p.prix_unitaire,
            DENSE_RANK() OVER (
                PARTITION BY
                    p.categorie_id
                ORDER BY p.prix_unitaire DESC
            ) AS rang
        FROM produits p
            JOIN categories c ON c.id = p.categorie_id
    )
SELECT
    categorie_nom,
    rang,
    produit_nom,
    prix_unitaire
FROM classement_produits
WHERE
    rang <= 2
ORDER BY categorie_nom ASC, rang ASC;