SELECT e1.id, e1.nom
FROM employes e1
WHERE
    NOT EXISTS (
        SELECT 1
        FROM employes e2
        WHERE
            e2.manager_id = e1.id
    );

--En SQL, NULL signifie "valeur inconnue"
--Quand on écrit NOT IN, SQL doit être sûr que l'employé est différent de toutes les valeurs de la liste.
--Dès qu'il croise un NULL, il hésite : Comme cette valeur est inconnue, je ne peux pas garantir que l'employé n'est pas dedans
--Dans le doute, SQL répond "Inconnu" plutôt que VRAI.
--Comme la clause WHERE n'affiche que ce qui est VRAI, la requête ne renvoie absolument rien