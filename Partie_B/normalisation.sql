--employe_id -> employe_nom, dept_id
--dept_id -> dept_nom
--projet_id -> projet_nom, chef_projet_id
--chef_projet_id -> chef_projet_nom, chef_projet_tel
--employe_id x projet_id

--3FN

--employe_id -> dept_id -> dept_nom : extraction de departements.
--projet_id -> chef_projet_id -> chef_projet_tel : extraction de chefs_projet.

--shéma

--departements
--PK : dept_id
--Attribut : dept_nom
--chefs_projet
--PK : chef_projet_id
--Attributs : chef_projet_nom, chef_projet_tel
--employes
--PK : employe_id
--Attribut : employe_nom
--FK : dept_id -> departements(dept_id)
--projets
--PK : projet_id
--Attribut : projet_nom
--FK : chef_projet_id -> chefs_projet(chef_projet_id)
--affectations
--PK : (employe_id, projet_id)
--FK : employe_id -> employes(employe_id)
--FK : projet_id -> projets(projet_id)