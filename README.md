# Documentation nextcloud

## Sommaire
- [Sources](#sources)
- [Pré-requis (connaissance)](#prerequis)
- [Installation de la base de donnée embarqué sqlite3](#sqlite3)
- [Installation de la base de donnée NoSQL MongoDB](#mongodb)
- [Installation du serveur Nextcloud](#installnextcloud)

<!-- Pour  ajouter un label utiliser un <span id=label></span>
 ---> 

<span id=sources></span> 
## Sources
[https://doc.ubuntu-fr.org/nextcloud-serveur](https://doc.ubuntu-fr.org/nextcloud-serveur)
*Ce qui suit est un résumé de la documentation du lien ci-dessus*

<span id=prerequis></span> 
## Pré-requis (connaissance) :

 - [x] Avoir un serveur Web avec PHP installé dessus (ici Apache2),  ainsi qu'une base de données (ici mysql).
 - [x] Savoir ajouter une tâche CRON
 - [ ] Savoir installer et activer des modules php et apache. Savoir créer une base de données MySQL.
 - [x] Avoir un PC client avec un navigateur web et un client SSH.
 - [x] Disposer des droits d'administration sur le serveur.
 - [x] Disposer d'une connexion à Internet configurée et activée.
 - [x] Savoir utiliser le terminal

<span id=sqlite3></span> 
## Installation de la base de donnée embarqué sqlite3
source : [https://doc.ubuntu-fr.org/sqlite](https://doc.ubuntu-fr.org/sqlite)

Pour installer la base de donéee sqlite3, il suffit de taper la commande:
```bash=
sudo apt install sqlite3
```

Pour rentrer dans le shell sqlite3, il faut taper:
```bash=
sqlite3
```

Pour quitter, il faut taper .quit

<span id=mongodb></span> 
## Installation de la base de donnée NoSQL MongoDB

source : [https://doc.ubuntu-fr.org/mongodb](https://doc.ubuntu-fr.org/mongodb)

Pour installer MongoDB il suffit d'utiliser les commandes ci-dessous:
```bash=
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 68818C72E52529D4
sudo echo "deb http://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
```
- [ ] Pas d'interferance avec apache ?
- [ ] Regarder comment utiliser mongodb
- [ ] Regarder robomongo pour interface graphique

<span id=installnextcloud></span> 
## Installation du serveur Nextcloud
Afin d'installer les paquets necessaires au bon fonctionnement de NextCloud on utilise la commande 
```bash=
sudo apt install apache2 
```

Une fois tous les paquets nécessaires installés, on installe NextCloud :

**A completer...**

```bash=
curl https://download.nextcloud.com/server/releases/nextcloud-17.0.2.zip 
```
### Installation des modules PHP manquant

La page d'installation indique qu'il manque des modules PHP. Connectez vous en SSH  avec les  droits d'administration  sur votre serveur, puis  
installez ces paquets ip:
```bash=
 $ apt install php-zip php-gd php-curl
```
Les installer ne suffit pas, il faut les activer, et redémarrer le serveur web pour que ceux ci soient pris en compte :
```bash=
 $ phpenmod zip gd curl
```
puis on redémarre le serveur Apache :
```bash=
 $ service apache2 restart
```
