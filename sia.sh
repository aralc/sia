#!/bin/bash
### SIA - System Infra Admin
### AUTOR : Marcos Moraes
### E-MAIL: mthiago.info@gmail.com	  
### Data : 09/08/2016

menu() {
	opt=$(dialog --stdout --title "SIA" --menu "MENU PRINCIPAL" 0 0 0 \
1 "Administrar Usuarios " \
2 "Administrar Discos " \
3 "Administrar Pacotes " \
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
	sh $(pwd)/SIA_DISCO.sh
	;;
	3)
	;;
	4)
	;;
	5)
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
	


#db=lpi
#table=lpi101
#user=root



	#begin 0 0 de acordo com a largura 
#nome=$(dialog --stdout --title "lpi" --inputbox "Qual o nome do aluno: " 0 0)
#nota=$(dialog --stdout --title "lpi" --inputbox "Qual a nota do aluno" 0 0)
#mysql -u $user -pbankai -e "insert into $table (nome,nota) values ('$nome',$nota)" $db
#dialog --stdout --title "LPI" --msgbox "Aluno $nome inserido no $db" 0 0
	
