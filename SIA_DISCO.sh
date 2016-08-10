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

#db=lpi
#table=lpi101
#user=root



	#begin 0 0 de acordo com a largura 
#nome=$(dialog --stdout --title "lpi" --inputbox "Qual o nome do aluno: " 0 0)
#nota=$(dialog --stdout --title "lpi" --inputbox "Qual a nota do aluno" 0 0)
#mysql -u $user -pbankai -e "insert into $table (nome,nota) values ('$nome',$nota)" $db
#dialog --stdout --title "LPI" --msgbox "Aluno $nome inserido no $db" 0 0
	
