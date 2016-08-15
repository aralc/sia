#!/bin/bash
#######################################################
# Script de instalação 				      #
# autor: marcos moraes				      #
# data: 15/08/2016				      #
#######################################################
DIRINST=/opt/sia
DIRTEMP=/opt/sia/tmp
DIREXE=/opt/sia/sh
DIRARQ=/opt/sia/info
clear
quem=$(whoami)
	echo "\033[0;31m ############################################### \033[0m"
	echo "\033[0;33m # Instalador SIMPLE INFRA ADMIN	       # \033[0m"
	echo "\033[0;31m ############################################### \033[0m"
#	echo "\033[0;32m Quem sou eu :$quem \033[0m" 
if [ "$quem" = "root" ]
	then 
	echo "\033[1;31m Voce é o $quem, entao podemos prosseguir com a instalacao \033[0m"
	echo "\033[3;31m Diretorio de instalcao $DIRINST \033[0m"
		if test -d /opt/sia
		then
		echo "\033[5;31m Diretorio ja existe \033[0m"
		else
			mkdir -v /opt/sia
			mkdir -v /opt/sia/sh
			mkdir -v /opt/sia/info
			mkdir -v /opt/sia/tmp
			mkdir -v /var/log/sia
		fi


		siau=$(cat /etc/passwd | cut -d : -f 1 | grep "siau" )
		echo "$siau"
		if [ "$siau" = "siau" ]
		then
			echo "\033[3;32m Usuario ja existe \033[0m"
		else
		echo "\033[3;31m Incluindo usuario \033[0m"
		useradd -m -d /home/siau -s /bin/bash siau
			siau=$(cat /etc/passwd | cut -d : -f 1 | grep "siau")
		fi
	
		echo "\033[3;31m Definia uma senha para o usuario $siau \033[0m"
		read siap
			echo siau:$siap | chpasswd
		clear
		echo "\033[4;31m Usuario $siau criado com a senha $siap \033[0m"
		echo "\033[4;31m Ajustando pemissoes de pasta \033[0m"
		chown -R siau:siau /opt/sia
		echo "\033[5;31m Verificando pacotes necessarios \033[0m"
		dialog=$(find /usr/bin -name "dialog" | cut -d / -f 4 )
		sudo=$(find /usr/bin -name "sudo" | cut -d / -f 4 )
		if test "$dialog" = "dialog"
			then 
			echo "\033[1;31m Pacote dialog instalado \033[0m"
			else 
			echo "\033[1;31m E preciso instalar o dialog \033[0m"
			echo "\033[2;32m Utiliza 1 - YUM ou 2 - APT-GET \033[0m"
			read opc
				if [ $opc -eq 1 ]
				then 
					yum install dialog 
				else 
					apt-get install dialog
				fi
			fi
			if test "$sudo" = "sudo"
				then
				echo "\033[1;31m Pacote sudo ja instalado \033[0m"
				else 
				echo "\033[1;31m E preciso instalar sudo \033[0m"
				if [ $opc -eq 1 ] 
				then 
					yum install sudo
				else 
					apt-get install dialog
				fi					
			fi
		tar -vxjf sia.tar.bz2 
		mv sia/sh/* $DIREXE
		cp $DIREXE/sia.sh /usr/bin
		home=$(cat /etc/passwd | cut -d : -f 6 | grep siau)
		echo $home
		if test -f /$home/.profile || test -f /$home/.bash_profile
			then 
			cd $home
			echo sia.sh >> .profile 
			echo sia.sh >> .bash_profile
			echo "diretorio exisita e foi incluido a linha ao final do mesmo"
			
			else 
			cd $home 
			touch .profile 
			touch .bash_profile
			echo "diretorio nao exitia"
			echo sia.sh >> .profile
			echo sia.sh >> .bash_profile 
			fi
		echo " alterando arquivos sudoers"
		cp /etc/sudoers /opt/sia/sudoers.bkp
		echo "siau ALL=NOPASSWD:/sbin/ifconfig ,/usr/sbin/useradd ,/usr/sbin/userdel, /usr/sbin/service, /sbin/ip" >> /etc/sudoers
		echo "Criar arquivo de log "
		touch /var/log/sia/sia.log
		chown -R siau:siau /opt/sia
		chown -R siau:siau /var/log/sia
		echo "\033[1;31m Instalcao concluida \033[0m"
				
	else 
	echo "\033[2;31m Voce não é root, solicite ao admin que faça a instalação \033[0m"
fi

