#!/bin/bash
### SIA - System Infra Admin
### AUTOR : Marcos Moraes
### E-MAIL: mthiago.info@gmail.com	  
### Data : 09/08/2016
DIREXE=/opt/sia/sh


#menu inicial
menu() {
	opt=$(dialog --stdout --title "SIA" --backtitle "http://www.bacteriadebits.com.br" --menu "MENU PRINCIPAL" 0 0 0 \
1 "Informacoes de sistema " \
2 "Informacoes de disco " \
3 "Administrar usuarios " \
4 "Administrar servicos" \
5 "Administrar rede " \
6 "Ler arquivos " \
7 "Ler Logs " \
8 "Sair" )



case $opt in
	1)
	sh $DIREXE/SIA_INFO.sh
	
	;;
	2)
	bash $DIREXE/SIA_DISCO.sh
	;;
	3)
	bash $DIREXE/SIA_USUARIO.sh
	;;
	4)
	bash $DIREXE/SIA_SERVICES.sh
	;;
	5)
	bash $DIREXE/SIA_REDE.sh
	;;
	6) 
	bash $DIREXE/SIA_ARQUIVO.sh
	;;
	7)
	bash $DIREXE/SIA_LOG.sh
	;;
	8)
	exit 0
	logout
	esac

}

trap menu 2 20
while true 
do 
menu 
done
logout	



