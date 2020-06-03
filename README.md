# Documentation nextcloud

## Sommaire
- [Sources](#sources)
- [Pré-requis (connaissance)](#prerequis)
- [Installation de la base de données embarqué sqlite3](#installsqlite3)
  - [Utiliser sqlite3 avec python3](#usesqlite3)
- [Installation de la base de données NoSQL MongoDB](#mongodb)
- [Installation du serveur Nextcloud](#installnextcloud)
  - [Installation de Nextcloud rapide](#fastinstallnextcloud)
- [Configuration graphique](#graphicalconf)
  - [Installation des modules](#installmodules)
    - [Modules selectionnés](#modulesselected)
  - [Activation du chiffrement côté serveur](#chiffrementserveur)
  - [Personnaliser l'interface](#personnalisation)
- [Développement d'un Plug-in test](#plugin)
	- [Installation d'un Plug-in test](#plugin-install)
<span id=sources></span> 
## Sources
<a href="https://wiki.debian-fr.xyz/Nextcloud_sur_une_Debian_9_Stretch_Apache2_%2B_SQLite_MariaDB_MySQL_%2B_certificat_SSL_et_https" target="_blank"> https://wiki.debianfr.xyz/Nextcloud_sur_une_Debian_9_Stretch_Apache2_%2B_SQLite_MariaDB_MySQL_%2B_certificat_SSL_et_https </a>
<a href="https://doc.ubuntu-fr.org/nextcloud-serveur" target="_blank"> https://doc.ubuntu-fr.org/nextcloud-serveur </a>

*Ce qui suit est un résumé de la documentation du lien ci-dessus*

<span id=prerequis></span> 
## Pré-requis (connaissance) :

 - [x] Avoir un serveur Web avec PHP installé dessus (ici Apache2), ainsi qu'une base de données (ici sqlite).
 - [x] Savoir ajouter une tâche CRON
 - [x] Savoir installer et activer des modules php et apache. Savoir créer une base de données sqlite3.
 - [x] Avoir un PC client avec un navigateur web et un client SSH.
 - [x] Disposer des droits d'administration sur le serveur.
 - [x] Disposer d'une connexion à Internet configurée et activée.
 - [x] Savoir utiliser le terminal

<span id=installsqlite3></span> 
## Installation de la base de données embarqué sqlite3
source : <a href="https://doc.ubuntu-fr.org/sqlite" target="_blank"> https://doc.ubuntu-fr.org/sqlite </a>
doc :  <a href="http://www.leppf.com/v02/spip.php?article90" target="_blank"> http://www.leppf.com/v02/spip.php?article90 </a>

Pour installer la base de données sqlite3, il suffit de taper la commande:
```bash=
sudo apt install sqlite3
```

Pour rentrer dans le shell sqlite3, il faut taper:
```bash=
sqlite3
```

Pour quitter, il faut taper .quit

<span id=usesqlite3></span> 
### Utiliser sqlite3 avec python3
source : <a href="https://docs.python.org/2/library/sqlite3.html" target="_blank"> https://docs.python.org/2/library/sqlite3.html </a>

Afin de se connecter et de stocker dans un fichier, on peut utiliser la commande :
```python=
import sqlite3
conn = sqlite3.connect('example.db')
```
Maintenant que nous sommes connectés, on peut utiliser les commandes SQL de la maniere suivante :
```python=
c = conn.cursor()

# Create table
c.execute('''CREATE TABLE stocks
 (date text, trans text, symbol text, qty real, price real)''')

# Insert a row of data
c.execute("INSERT INTO stocks VALUES ('2006-01-05','BUY','RHAT',100,35.14)")

# Save (commit) the changes
conn.commit()

# We can also close the connection if we are done with it.
# Just be sure any changes have been committed or they will be lost.
conn.close()
```

<span id=mongodb></span> 
## Installation de la base de données NoSQL MongoDB

source : [https://doc.ubuntu-fr.org/mongodb](https://doc.ubuntu-fr.org/mongodb?target=_blank)

Pour installer MongoDB il suffit d'utiliser les commandes ci-dessous:
```bash=
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 68818C72E52529D4
sudo echo "deb http://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
```

<span id=installnextcloud></span> 
## Installation du serveur Nextcloud
Afin d'installer les paquets nécessaires au bon fonctionnement de NextCloud on utilise la commande 
```bash=
sudo apt install apache2 php
```

On installe ensuite NextCloud :

```bash=
wget https://download.nextcloud.com/server/releases/nextcloud-17.0.2.zip
unzip nextcloud-17.0.2.zip -d /var/www/html 
```
Et il ne faut pas oublier de donner les droits a apache2 :
```bash=
chown -R www-data:www-data /var/www/html/nextcloud
```
<!--  NE PAS FAIRE ! Soucis de fichier caché
On peut mettre nextcloud par défaut sur l'oridinateur avec la commande:
```bash
mv /var/www/html/nextcloud/* /var/www/html
```
--->
La page d'installation indique qu'il manque des modules PHP. Connectez vous en SSH  avec les  droits d'administration  sur votre serveur, puis installez ces paquets ip :
```bash=
apt install php-zip php-dom php-curl php-gd php-mbstring php-sqlite3 php-ldap
```
Les installer ne suffit pas. Il faut les activer, et redémarrer le serveur web pour que ceux-ci soient pris en compte :
```bash=
phpenmod zip dom curl gd mbstring sqlite3 ldap
```
puis on redémarre le serveur Apache :
```bash=
service apache2 restart
```

<span id=fastinstallnextcloud></span> 
Pour aller plus vite, on peut lancer la suite de commande suivante :
```bash
sudo apt install unzip sqlite3 apache2 php php-zip php-dom php-curl php-gd php-mbstring php-sqlite3 php-ldap
phpenmod zip dom curl gd mbstring sqlite3 ldap
wget https://download.nextcloud.com/server/releases/nextcloud-17.0.2.zip
unzip nextcloud-17.0.2.zip -d /var/www/html 
chown -R www-data:www-data /var/www/html/nextcloud
service apache2 restart
```

pensez à changer l'ip dans le fichier /var/www/html/nextcloud/config/config.php


<span id=graphicalconf></span> 

# Configuration graphique

<span id=installmodules></span> 
## Installation des modules : 

Lorsque l'on est sur la page d'acceuil de Nextcloud, il faut cliquer sur l'icône de l'utilisateur "root", puis "Applications".
On obtient alors la liste de tous les modules disponibles/activés.

<span id=modulesselected></span> 
### Modules selectionnés : 

Dans "fichier", nous avons choisi d'installer :

* File access control -> Permet de contrôler les droits d'accès à un document
* PDF viewer -> Permet de visionner les documents PDF

Dans "multimédia" :

* Talk -> Permet d'utiliser un chat textuel, audio & vidéo

Dans "Bureautique & texte" :

* Calendar -> Permet d'utiliser un calendrier personnel ou d'intégrer un calendrier
* Notes -> Permet de créer des notes, le Markdown est disponible

Nous avions également des modules intégrés à l'installation (de Nextcloud) :

* Fichier -> Stockage et partage de fichiers = Drive
* Activité -> Logs du compte
* Galerie -> Stockage et partage de photos


<span id=chiffrementserveur></span>
## Activation du chiffrement côté serveur : 

* Aller dans les applications désactivées et activer "Default encryption module"
* Aller dans les paramètres, administration puis sécurité et cocher "Activer le chiffrement côté serveur"


<span id=personnalisation></span>
## Personnaliser l'interface : 

Aller dans paramètres, administration puis personnaliser l'apparence. Ici, il est possible de :
* Changer le logo du site
* Changer la couleur de l'interface
* Changer le nom
* Changer le nom du lien de la page d'accueil
* Changer l'image de connexion
* Changer le logo d'en-tête
* Changer le Favicon (petit logo en haut à gauche)

<span id=plugin></span>
## Développement d'un Plug-in test
<span id=plugin-install></span>
### Installation
La documentation suivie se trouve [ici](https://docs.nextcloud.com/server/stable/developer_manual/app/intro.html)

Pour commencer, il faut créer un squelette de la nouvelle application que nous allons développés. Pour cela il suffit de se rendre [ici](https://apps.nextcloud.com/developer/apps/generate), de remplir les différents champs et de télécharger le squelette de l'application app.tar.gz .  Il faudra copiez celui-ci sur le serveur et la décompresser avec la commande : 
 ```bash
tar xzvf app.tar.gz
```
Ici, le plugin s'appellera apptest 
On met ensuite en place l'environnement de dévellopement de nextcloud :
```bash
git clone https://github.com/nextcloud/server.git --branch stable17
cd server
git submodule update --init
```
Ensuite activer le mode débogage en créant le fichier ```/var/www/html/nextcloud/apps/apptest/server/config/config.php```, et y mettant la configuration ci-dessous :
```php
<?php
$CONFIG = array (
	'debug' => true,
);
```
On peut ensuite créer l'instance test avec la commande
```bash
cd  /var/www/html/nextcloud && php -S 10.18.122.39:8080
```
L'adresse 10.18.122.39 correspond a l'adresse ip locale routée de la machine .
Ne pas oublier de vérifier avant votre adresse ip et l'emplacement racine du serveur Nextcloud .
Penser a ouvrir un deuxième terminal pour pouvoir voir les log en même temps que le développement.

Il suffit désormais simplement d'activer l'application. Pour cela, on se rend sur [http://51.15.37.21:8080/index.php/settings/apps](http://51.15.37.21:8080/index.php/settings/apps), on recherche le nom de l'application, on l'installe, et on l'active. On a donc notre application qui fonctionne avec un nouvelle onglet sur le haut qui porte le nom de l'application et un message "Hello World" !
