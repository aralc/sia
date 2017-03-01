#!/bin/bash
### SIA - System Infra Admin
### AUTOR : Marcos Moraes
### E-MAIL: mthiago.info@gmail.com	  
### Data : 09/08/2016
DIREXE=/opt/sia/sh
	#menu inicial
		menu() {
			opt=$(dialog --stdout --title "SIA" --backtitle "http://www.bacteriadebits.com.br" --menu "MENU PRINCIPAL" 0 0 0 \
			1 "Informacoes de Sistema " \
			2 "Informacoes de Disco " \
			3 "Administrar Usuarios " \
			4 "Administrar Servicos" \
			5 "Administrar Rede " \
			6 "Ler Arquivos " \
			7 "Ler Logs " \
			8 "Sair" )
				case $opt in
				1)
				bash $DIREXE/sia_info.sh
				;;
				2)
				bash $DIREXE/sia_disco.sh
				;;
				3)
				bash $DIREXE/sia_usuario.sh
				;;
				4)
				bash $DIREXE/sia_services.sh
				;;
				5)
				bash $DIREXE/sia_rede.sh
				;;
				6) 
				bash $DIREXE/sia_arquivo.sh
				;;
				7)
				bash $DIREXE/sia_log.sh
				;;
				8)
				exit 0
				#logout
				esac
			}
	trap menu 2 20
		while true 
		do 
		menu 
		done
		exit 		



