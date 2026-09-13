CREATE DATABASE IF NOT EXISTS samsung_db;
USE samsung_db;

-- 01 : Sélection de clients basée sur des critères multiples

SELECT
	ID_Client,
    Age,
    Revenu_Annuel,
    Date_Inscription,
    ROUND(Score_Fidelite, 2) AS Score_Fidelite
FROM
	clients_samsung
WHERE
	Age >= 30
    AND Revenu_Annuel BETWEEN 40000 AND 70000
    AND Date_Inscription > '2018-01-01'
    AND Score_Fidelite > 5;

-- 02 : Analyse des ventes avec multiples conditions

SELECT
	ID_Vente,
    Montant_Total,
    ROUND(Score_Satisfaction, 2) AS Score_Satisfaction,
    Delai_Livraison_Jours,
    Canal_Achat
FROM
	ventes_samsung
WHERE 
	Montant_Total > 1000
    AND Score_satisfaction < 3
    AND Canal_Achat = 'En ligne'
    AND Delai_Livraison_Jours > 20
ORDER BY 
	Montant_Total DESC;


-- 03 : Diversité des pays de vente

SELECT
	DISTINCT Pays_Vente
FROM 
	ventes_samsung
ORDER BY
	Pays_Vente;

-- 04 : Analyse des canaux de vente et satisfaction des clients

SELECT
	Canal_Achat,
    ROUND(AVG(Score_Satisfaction), 2) AS Score_moyen_satisfaction,
    SUM(Montant_Total) AS Total_Ventes
FROM
	ventes_samsung
GROUP BY
	Canal_Achat;

-- 05 : Produits et leur popularité

SELECT
	p.ID_Produit,
    p.Nom_Produit,
    p.Prix,
    COUNT(v.ID_Vente) AS nombre_ventes
FROM
	produits_samsung p 
    LEFT JOIN ventes_samsung v 
		ON p.ID_Produit = v.ID_Produit
GROUP BY
	p.ID_Produit,
	p.Nom_Produit,
    p.Prix
ORDER BY 
	nombre_ventes DESC;

-- 06 : Profilage des clients

SELECT
	Pays,
    ROUND(AVG(Age)) AS age_moyen,
    MAX(Revenu_Annuel) AS revenu_max
FROM
	clients_samsung
GROUP BY 
	Pays
ORDER BY revenu_max DESC;

-- 07 : Analyse des méthodes d'expédition

SELECT 
	Methode_Expedition,
	MIN(Delai_Livraison_Jours) AS delai_liv_min,
    ROUND(AVG(Score_Satisfaction), 2) AS score_moyen_satisfaction
FROM 
	ventes_samsung
GROUP BY 
	Methode_Expedition;

-- 08 : Analyse de la fidélité des clients

SELECT 
	CASE
		WHEN Score_Fidelite < 5 THEN 'Faible'
        WHEN Score_Fidelite BETWEEN 5 AND 7 THEN 'Moyen'
        ELSE 'Elevé'
	END AS cat_score_fidelite,
    COUNT(ID_Client) AS nombre_clients	
FROM
	clients_samsung
GROUP BY
	cat_score_fidelite
ORDER BY
	nombre_clients DESC;

-- 09 : Analyse des produits populaires

SELECT 
	ID_Produit,
    SUM(Montant_Total) AS total_ventes
FROM
	ventes_samsung
GROUP BY 
	ID_Produit
HAVING 
	total_ventes > 15000
ORDER BY 
	total_ventes DESC;
    
-- 10 : Identification des pays à forte activité commerciale
SELECT
	Pays_Vente,
    COUNT(ID_Vente) AS nombre_ventes
FROM
	ventes_samsung
GROUP BY
	Pays_Vente
HAVING
	nombre_ventes > 400;

-- 11 : Analyse des ventes par mois

SELECT 
	DATE_FORMAT(Date_Vente, '%M') AS mois_ventes,
    SUM(Montant_Total) AS total_ventes
FROM
	ventes_samsung
WHERE 
	DATE_FORMAT(Date_Vente, '%Y') = '2021'
GROUP BY
	DATE_FORMAT(Date_Vente, '%m'),
	mois_ventes
ORDER BY 
	DATE_FORMAT(Date_Vente, '%m');

-- 12 : Classification des ventes par jour de la semaine

SELECT
	CASE 
		WHEN DATE_FORMAT(Date_Vente, '%w') IN ('0', '6') THEN 'Weekend'
        ELSE 'Semaine'
	END AS catDay,
    COUNT(ID_Vente) AS nombre_ventes
FROM
	ventes_samsung
GROUP BY 
	catDay;

-- 13 : Catégorisation des ventes par période de l'année

SELECT
	CASE 
		WHEN DATE_FORMAT(Date_Vente, '%c') IN ('1', '2', '3', '4') THEN '1. Début d''année'
		WHEN DATE_FORMAT(Date_Vente, '%c') IN ('5', '6', '7', '8') THEN '2. Milieu d''année'
        ELSE '3. Fin d''année'
	END AS catVente,
    SUM(Montant_Total) AS total_vente
FROM 
	ventes_samsung
GROUP BY 
	catVente
ORDER BY
    catVente;    
    
-- 14 : Clients fidèles dans des pays spécifiques

SELECT
	ID_Client,
    Pays,
    ROUND(AVG(Score_Fidelite), 2) AS score_moyen_fidelite
FROM  
	clients_samsung
WHERE
	Pays IN ('France', 'Allemagne')
GROUP BY
	ID_Client,
    Pays
HAVING 
	score_moyen_fidelite > 7
ORDER BY 
	score_moyen_fidelite DESC;  

-- 15 : Catégorisation des clients selon leur Revenu et Leur Âge

SELECT
	CASE
		WHEN Age < 35 AND Revenu_Annuel > 50000 THEN 'Jeune à Revenu Elevé'
        WHEN Age < 35 AND Revenu_Annuel BETWEEN 30000 AND 50000 THEN 'Jeune à Revenu Moyen'
        WHEN Age < 35 AND Revenu_Annuel < 30000 THEN 'Jeune à Revenu Faible'
        WHEN Age >= 35 AND Revenu_Annuel > 50000 THEN 'Senior à Revenu Élevé'
        WHEN Age >= 35 AND Revenu_Annuel BETWEEN 30000 AND 50000 THEN 'Senior à Revenu Moyen'
        WHEN Age >= 35 AND Revenu_Annuel < 30000 THEN 'Senior à Revenu Faible'
        ELSE 'Non classé'
    END AS Segment_Client,
	ID_Client,
    Age,
    Revenu_Annuel
FROM  
	clients_samsung;	

-- 16 : Tendances des ventes par mois

SELECT
	DATE_FORMAT(Date_Vente, '%M') AS mois_vente,
    SUM(Quantite_Vendue) AS quantite_totale_vendue
FROM
	ventes_samsung
GROUP BY
	DATE_FORMAT(Date_Vente, '%m'),
	mois_vente
ORDER BY 
	DATE_FORMAT(Date_Vente, '%m');

-- 17 : Analyse croisée des produits par gamme et pays de vente

SELECT
	p.Gamme,
    v.Pays_Vente,
    COUNT(v.ID_Vente) AS nombre_ventes,
    SUM(v.Montant_Total) AS total_ventes
FROM
	ventes_samsung v 
	INNER JOIN produits_samsung p 
		ON v.ID_Produit = p.ID_Produit
GROUP BY
	p.Gamme,
    v.Pays_Vente
ORDER BY
    p.Gamme,
    total_ventes DESC;  

-- 18 : Analyse croisée multi-dimensionnelle des performances produits

SELECT
	p.Gamme,
    v.Canal_Achat,
	COUNT(v.ID_Vente) AS nombre_ventes,
    SUM(v.Quantite_Vendue) AS quantite_totale_vendue,
	SUM(v.Montant_Total) AS montant_total_ventes,
    ROUND(AVG(v.Score_Satisfaction), 2) AS satisfaction_moyenne
FROM
	ventes_samsung v 
    LEFT JOIN produits_samsung p 
		ON v.ID_Produit = p.ID_Produit
GROUP BY
	p.Gamme,
	v.Canal_Achat
ORDER BY
	p.Gamme,
    v.Canal_Achat;

-- 19 : Évolution des ventes mensuelles selon les gammes de produits

SELECT
    DATE_FORMAT(v.Date_Vente, '%M') AS mois_vente,
    p.Gamme,    
    COUNT(v.ID_Vente) AS nombre_ventes,
    SUM(v.Montant_Total) AS chiffre_affaires_total,
    SUM(v.Quantite_Vendue) AS quantite_totale_vendue,
    ROUND(AVG(v.Delai_Livraison_Jours), 2) AS delai_livraison_moyen
FROM
    ventes_samsung v
    INNER JOIN produits_samsung p
        ON v.ID_Produit = p.ID_Produit
WHERE
    DATE_FORMAT(v.Date_Vente, '%Y') = '2021'
GROUP BY
    DATE_FORMAT(v.Date_Vente, '%m'),
    mois_vente,
    p.Gamme
ORDER BY
    DATE_FORMAT(v.Date_Vente, '%m'),
    p.Gamme;

-- 20 : Analyse du comportement client

SELECT
	c.Canal_Prefere,
    c.Preference_Produit,
    COUNT(DISTINCT c.ID_Client) AS nombre_clients_uniques,
    SUM(v.Montant_Total) AS montant_total_depense,
    ROUND(AVG(c.Score_Fidelite), 2) AS score_moyen,
    CASE
		WHEN AVG(c.Score_Fidelite) > 6 AND SUM(v.Montant_Total) > 200000 THEN 'VIP'
        ELSE 'Standard'
	END AS classification_client
FROM
	clients_samsung c 
	INNER JOIN ventes_samsung v  
		ON c.ID_Client = v.ID_Client
WHERE
	Date_Inscription > '2018-01-01'
GROUP BY 
	c.Canal_Prefere,
    c.Preference_Produit    
ORDER BY
	c.Canal_Prefere,
    c.Preference_Produit;
    
    
    
