#!/bin/bash
### SIA - System Infra Admin
### AUTOR : Marcos Moraes
### E-MAIL: mthiago.info@gmail.com	  
### Data : 09/08/2016



#menu inicial
menu() {
	opt=$(dialog --stdout --title "SIA" --menu "MENU PRINCIPAL" 0 0 0 \
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
	sh $(pwd)/SIA_INFO.sh
	
	;;
	2)
	bash $(pwd)/SIA_DISCO.sh
	;;
	3)
	bash $(pwd)/SIA_USUARIO.sh
	;;
	4)
	bash $(pwd)/SIA_SERVICES.sh
	;;
	5)
	bash $(pwd)/SIA_REDE.sh
	;;
	6) 
	bash $(pwd)/SIA_ARQUIVO.sh
	;;
	7)
	bash $(pwd)/SIA_LOG.sh
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
	


