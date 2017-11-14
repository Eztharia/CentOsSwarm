#!/bin/bash

# Ajout des clés ssh
function ConfigurationSSH {

if [ $(id -u) -eq 1000 ]; then
	# Génération de la clé ssh
	ssh-keygen -t rsa -b 4096 -C "garlic@iaas.dbz"
	echo " " 
	
else
	echo " "
	echo "Vous devez lancer ce script depuis l'utilisateur iaas"
	exit 2
fi

ssh-copy-id -o "StrictHostKeyChecking no" -f -i /home/iaas/.ssh/id_rsa.pub iaas@10.0.255.241
ssh-copy-id -o "StrictHostKeyChecking no" -f -i /home/iaas/.ssh/id_rsa.pub iaas@10.0.255.242

# Restart du service réseau
service network restart >/dev/null
echo " "
[ $? -eq 0 ] && echo "Script de configuration terminé, connectez vous sur $username@$ipadd !" || echo "Echec de configuration de l'adressage statique !"
echo " "
}
	