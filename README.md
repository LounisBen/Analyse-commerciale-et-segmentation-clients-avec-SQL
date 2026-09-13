# Analyse commerciale avec SQL

## Présentation du projet

Ce projet SQL porte sur l'analyse de données commerciales relatives aux clients,
produits et ventes d'une entreprise du secteur de l'électronique.

L'objectif est d'interroger une base de données relationnelle afin d'analyser
les performances commerciales, le comportement des clients, les produits
et l'évolution des ventes.

> Projet pédagogique réalisé dans le cadre de ma formation Data Analyst.

---

## Base de données

L'analyse repose sur trois tables principales :

- `clients_samsung` : informations sur les clients ;
- `produits_samsung` : informations sur les produits ;
- `ventes_samsung` : transactions commerciales.

Les relations entre les tables sont réalisées notamment avec :

- `ID_Client` pour relier les clients aux ventes ;
- `ID_Produit` pour relier les produits aux ventes.

---

## Objectifs de l'analyse

Les 20 requêtes SQL permettent notamment de :

- sélectionner des clients selon plusieurs critères ;
- analyser les ventes et la satisfaction client ;
- comparer les différents canaux d'achat ;
- mesurer la popularité des produits ;
- analyser les profils clients par pays ;
- étudier les méthodes d'expédition ;
- segmenter les clients selon leur fidélité ;
- identifier les produits générant le plus de chiffre d'affaires ;
- analyser les pays à forte activité commerciale ;
- étudier les ventes par mois et par période ;
- segmenter les clients selon leur âge et leur revenu ;
- analyser les performances par gamme de produits ;
- croiser gamme, pays et canal d'achat ;
- étudier l'évolution mensuelle des ventes ;
- analyser le comportement et la valeur des clients.

---

## Compétences SQL mobilisées

### Filtrage des données

- `WHERE`
- `AND`
- `BETWEEN`
- `IN`
- filtres sur les dates

### Agrégations

- `COUNT()`
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`
- `ROUND()`

### Regroupements

- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `DISTINCT`

### Segmentation

Utilisation de `CASE WHEN` pour créer différentes catégories :

- niveau de fidélité ;
- période de vente ;
- jour de semaine / week-end ;
- segmentation selon l'âge et le revenu ;
- classification de groupes de clients.

### Analyse temporelle

Utilisation de `DATE_FORMAT()` pour analyser :

- les ventes par mois ;
- les ventes par année ;
- les jours de semaine et week-ends ;
- les différentes périodes de l'année.

### Jointures

Utilisation de :

- `INNER JOIN`
- `LEFT JOIN`

pour croiser les tables clients, produits et ventes.

---

## Analyses avancées

Les dernières requêtes permettent de réaliser des analyses multidimensionnelles.

### Gamme × Pays

Analyse du nombre de ventes et du chiffre d'affaires par gamme de produit
et par pays.

### Gamme × Canal d'achat

Analyse croisée de :

- nombre de ventes ;
- quantité vendue ;
- montant total des ventes ;
- satisfaction moyenne.

### Évolution mensuelle par gamme

Analyse de l'évolution mensuelle des performances produits avec :

- nombre de ventes ;
- chiffre d'affaires ;
- quantité vendue ;
- délai moyen de livraison.

### Comportement client

Analyse croisée du :

- canal préféré ;
- produit préféré ;
- nombre de clients ;
- montant total dépensé ;
- score moyen de fidélité.

Une classification est également créée à partir du niveau de fidélité
et du montant total dépensé.

---

## Technologies utilisées

- SQL
- MySQL / MariaDB

---

## Compétences développées

Ce projet m'a permis de travailler sur :

- l'interrogation d'une base de données relationnelle ;
- l'analyse commerciale avec SQL ;
- les agrégations et regroupements ;
- les jointures entre plusieurs tables ;
- la segmentation client ;
- l'analyse temporelle ;
- la création d'indicateurs commerciaux ;
- l'analyse multidimensionnelle des ventes.
