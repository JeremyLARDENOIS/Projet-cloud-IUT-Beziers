


# Documentation nextcloud

## Sommaire
- [Sources](#sources)
- [Pré-requis (connaissance)](#prerequis)
- [Installation de la base de données embarqué sqlite3](#installsqlite3)
- [Utiliser sqlite3 avec python3](#usesqlite3)
- [Installation de la base de données NoSQL MongoDB](#mongodb)
- [Installation du serveur Nextcloud](#installnextcloud)

<!-- Pour  ajouter un label utiliser un <span id=label></span>
 ---> 
 <!-- Vous pouvez rajouter ?target=_blank a la fin de l'URL pour l'ouvrir dans un nouvel onglet
 ou alors le mettre comme en html
 <a href="" target="_blank">  </a>
 --->

<span id=sources></span> 
## Sources
<a href="https://wiki.debian-fr.xyz/Nextcloud_sur_une_Debian_9_Stretch_Apache2_%2B_SQLite_MariaDB_MySQL_%2B_certificat_SSL_et_https" target="_blank"> https://wiki.debian-fr.xyz/Nextcloud_sur_une_Debian_9_Stretch_Apache2_%2B_SQLite_MariaDB_MySQL_%2B_certificat_SSL_et_https </a>
<a href="https://doc.ubuntu-fr.org/nextcloud-serveur" target="_blank"> https://doc.ubuntu-fr.org/nextcloud-serveur </a>
*Ce qui suit est un résumé de la documentation du lien ci-dessus*

<span id=prerequis></span> 
## Pré-requis (connaissance) :

 - [x] Avoir un serveur Web avec PHP installé dessus (ici Apache2), ainsi qu'une base de données (ici sqlite).
 - [x] Savoir ajouter une tâche CRON
 - [ ] Savoir installer et activer des modules php et apache. Savoir créer une base de données sqlite3.
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
## Utiliser sqlite3 avec python3
source : 
<a href="https://docs.python.org/2/library/sqlite3.html" target="_blank"> https://docs.python.org/2/library/sqlite3.html </a>

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
sudo apt install apache2 
```

Une fois tous les paquets nécessaires installés, on installe NextCloud :

```bash=
wget https://download.nextcloud.com/server/releases/nextcloud-17.0.2.zip
unzip nextcloud-12.0.4.zip -d /var/www/html 
```
Et il ne faut pas oublier de donné les droits a apache2 :
```bash=
chown -R www-data:www-data /var/www/nextcloud
```
### Installation des modules PHP manquant

La page d'installation indique qu'il manque des modules PHP. Connectez vous en SSH  avec les  droits d'administration  sur votre serveur, puis installez ces paquets ip :
```bash=
 $ apt install php-zip php-gd php-curl
```
Les installer ne suffit pas. Il faut les activer, et redémarrer le serveur web pour que ceux-ci soient pris en compte :
```bash=
 $ phpenmod zip gd curl
```
puis on redémarre le serveur Apache :
```bash=
 $ service apache2 restart
```
