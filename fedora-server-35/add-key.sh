#!/bin/bash
#Ajout de la clé SSH publique de l'utilisateur vagrant pour pouvoir utilisé la commande vagrant ssh
mkdir /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh
wget -O /home/vagrant/.ssh/authorized_keys https://raw.githubusercontent.com/hashicorp/vagrant/main/keys/vagrant.pub
chmod 0600 /home/vagrant/.ssh/authorized_keys