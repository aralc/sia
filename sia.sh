#!/bin/bash
### SIA - System Infra Admin
### AUTOR : Marcos Moraes
### E-MAIL: mthiago.info@gmail.com	  
### Data : 09/08/2016

menu() {
	opt=$(dialog --stdout --title "SIA" --menu "MENU PRINCIPAL" 0 0 0 \
1 "Administrar Usuarios " \
2 "Administrar Discos " \
3 "Informacoes de Sistema " \
4 "Administrar Arquivos " \
5 "Administrarr Servicos " \
6 "Administrar Rede " \
7 "Administrar Logs " \
8 "Sair" )



case $opt in
	1)
	sh $(pwd)/SIA_USUARIO.sh
	
	;;
	2)
	bash $(pwd)/SIA_DISCO.sh
	;;
	3)
	bash $(pwd)/SIA_INFO.sh
	;;
	4)
	;;
	5)
	bash $(pwd)/SIA_SERVICES.sh
	;;
	6) 
	bash $(pwd)/SIA_REDE.sh
	;;
	8)
	exit 0
	esac

}

trap menu 2 20
while true 
do 
menu 
done
	



