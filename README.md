Projet : Petit Réseau Social avec Laravel  

Ce projet est une application très simple développée avec Laravel en tant que framework front-end et back-end. Il s'agit d'un mini réseau social permettant uniquement de :  
- Créer des publications.  
- Envoyer, accepter ou refuser des demandes d’amis.  
- Supprimer d'anciennes publications ou des demandes d’amis précédentes.  

Sur votre page de profil, vous verrez vos propres publications ainsi que celles de tous vos amis, classées de la plus récente à la plus ancienne.  

Veuillez noter que la page de connexion et d'inscription est responsive au sein du site, tandis que toutes les autres pages nécessitent un écran plus grand pour un fonctionnement optimal.

Objectif du projet:
L'objectif de ce projet est de démontrer des compétences en développement avec Laravel. Par conséquent, certaines fonctionnalités et pages sont absentes, comme la modification du profil ou des pages telles que "À propos" ou "Contact".  

Aucune exigence stricte pour le mot de passe.  

Installation et exécution:  
Pour exécuter le site, vous avez besoin de  XAMPP.  

1. Démarrez Apache et MySQL.  
2. Créez une base de données nommée small_facebook, avec l'encodage utf8mb4_general_ci, sans mot de passe.  

Vous avez ensuite deux méthodes pour l’installation :  

Méthode 1 : Importation manuelle de la base de données
- Accédez à phpMyAdmin et importez le fichier small_facebook.sql inclus dans le projet.  
- Copiez tous les fichiers du projet dans le répertoire de votre serveur local.  
- Ouvrez un terminal, accédez au dossier du projet et exécutez :  

  php artisan serve

Méthode 2 : Utilisation des migrations Laravel
- Ouvrez un terminal, accédez au dossier du projet et exécutez :  

  php artisan serve

- Ensuite, lancez dans un deuxième terminal(sans fermer le premier):  

  php artisan migrate

 Dans tous les cas après avoir passé la commande

  php artisan serve

Laravel générera alors un lien que vous pourrez utiliser pour accéder au site via votre navigateur.  

Activation des fichiers CSS et JavaScript
Avant d’accéder au site, ouvrez un deuxième terminal(sans fermer le premier), accédez au dossier du projet et exécutez :  

npm run dev

Accès et utilisation du site
Ouvrez votre navigateur et entrez l'URL générée par Laravel (dans l'une des méthodes ci-dessus).  


Une fois le site lancé, toutes les données seront enregistrées dans la base de données. Toute publication ajoutée ou supprimée, ainsi que toute demande d'ami envoyée, acceptée ou refusée, sera sauvegardée.  

Remarque importante  
Bien que le site soit totalement fonctionnel, son objectif principal est de démontrer des compétences en développement avec Laravel.  

Développé par Jamal Abou Kassem.
