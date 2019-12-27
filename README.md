# Documentation nextcloud

## Sources :
[https://doc.ubuntu-fr.org/nextcloud-serveur](https://doc.ubuntu-fr.org/nextcloud-serveur)
*Ce qui suit est un résumé de la documentation du lien ci-dessus*

## Pré-requis (connaissance) :

 - [ ] Disposer d'un serveur
 - [ ] Avoir un serveur Web avec PHP installé dessus (ici Apache2),  ainsi qu'une base de données (ici mysql).
 - [ ] Savoir ajouter une tâche CRON
 - [ ] Savoir installer et activer des modules php et apache. Savoir créer une base de données MySQL.
 - [ ] Avoir un PC client avec un navigateur web et un client SSH.
 - [ ] Disposer des droits d'administration sur le serveur.
 - [ ] Disposer d'une connexion à Internet configurée et activée.
 - [ ] Savoir utiliser le terminal

## Installation du serveur Nextcloud
Afin d'installer les paquets necessaires au bon fonctionnement de NextCloud on utilise la commande 
```bash=
sudo apt install apache2 
```

Une fois tous les paquets nécessaires installés, on installe NextCloud :

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
