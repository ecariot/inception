# Inception  🔲

Bonne base de travail :
https://tuto.grademe.fr/inception/

Installer sa VM : https://github.com/codesshaman/inception
Tuto en russe mais facile a traduire.

Installer extension SSH local host pour travailler depuis sa machine sur VSCODE

Souvent erreur :
fatal corrupt loose object lorsqu'on essaye de commit ou de push.
Suivre cette methode : https://stackoverflow.com/questions/4254389/git-corrupt-loose-object

Lire la doc  sur Docker - Aller sur docker Hub.

```docker system prune -af ``` tres utile si le make ne s'est pas bien passe et qu'il faut recommencer

.env pour wordpress : https://developer.wordpress.org/reference/hooks/wp_mail_charset/

creer image
```docker build -t mon_image ```

lancer le container
```docker run -it -p 80:80 -p 443:443 mon_image```

supprimer toutes les images
```docker rmi -f $(docker images -a -q)```

supprimer tous les containers

```docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)```

entrer dans container
```docker exec -it id_container bash```

verifier ler erreur ngninx dans le conatiner
```cat /var/log/nginx/error.log```

check les erreur du lancment du container
```docker logs --tail=50 --follow --timestamps id_container```

doc pour le script de mariadb : https://mariadb.com/kb/en/mysql-command-line-client/

run wordpress
```docker run --name some-wordpress -p 8080:80 -d wordpress```

supprimer tous les volumes :
```docker volume rm $(docker volume ls -q)```

ERREURS FREQUENTES RENCONTREES :

resoudre l'erreur ```bind already in use```
regarder : https://www.curiousm.com/labs/2020/10/08/resolving-bind-address-already-in-use-when-starting-a-docker-instance/

```sudo lsof -i tcp:3306```
```sudo kill -9 a484aee07bab``` a faire sans le ```-9``` si ca ne fonctionne pas.
```sudo kill -9 28149```

resoudre l'erreur ```Access denied for user 'root'@'localhost' (using password: NO)```
regarder https://stackoverflow.com/questions/46193743/access-denied-for-user-rootlocalhost-using-password-no-whats-wrong


resoudre l'erreur ```Error: Cannot select database. The database server could be connected to (which means your username and password is okay) but the `wordpress` database could not be selected.```
