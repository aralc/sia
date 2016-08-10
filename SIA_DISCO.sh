#!/bin/bash
### SIA - System Infra Admin
### AUTOR : Marcos Moraes
### E-MAIL: mthiago.info@gmail.com	  
### Data : 09/08/2016

SIA_DIS(){
optD=$(dialog --stdout --title "SIA - ADMIN DISCO" --menu "Administracao Disco" 0 0 0 \
1 "Verificar espaco disco" \
2 "Voltar ")
	case $optD in 
		1)
			disco=$(df -h | cut -d "%" -f1 | tr [a-z] [A-Z])
		dialog --stdout --title "SIA - ADMIN DISCO" --msgbox "$disco" 0 0 
		;;			
		2) sh $(pwd)/sia.sh
		
		#read -p "Pressione um teclara para continuar" teclado	
	esac

}
	
SIA_DIS





