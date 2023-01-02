# inception

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

#################
creer image
#################
docker build -t mon_image .

#######################
lancer le container #
#######################
docker run -it -p 80:80 -p 443:443 mon_image

###############################
supprimer toutes les images #
###############################
docker rmi -f $(docker images -a -q)

#################################
supprimer tous les containers #
#################################
docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)

#########################
entrer dans container #
#########################
docker exec -it id_container bash

#################################################
verifier ler erreur ngninx dans le conatiner #
#################################################
cat /var/log/nginx/error.log

#################################################
check les erreur du lancment du container     #
################################################# 
docker logs --tail=50 --follow --timestamps id_container

