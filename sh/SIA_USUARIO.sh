#!/bin/bash
### SIA - System Infra Admin
### AUTOR : Marcos Moraes
### E-MAIL: mthiago.info@gmail.com	  
### Data : 09/08/2016

SIA_USU(){
optU=$(dialog --stdout --title "SIA - ADMIN USUARIO" --menu "Administracao Usuario" 0 0 0 \
1 "Adicionar usuario" \
2 "Remover usuario" \
3 "Adicionar grupo" \
4 "Remover grupo" \
5 "Consultar usuario" \
6 "Cosnutlar grupo" \
7 "Voltar ")
	case $optU in 
		1)
		usuario=$(dialog --stdout --title "SIA - ADD USUARIO" --inputbox "Informe o login:" 0 0)
		useradd $usuario
		senha=$(dialog --stdout --title "SIA - ADD USUARIO" --passwordbox "Informe a senha:" 0 0)
		echo $usuario:$senha | chpasswd 
		SIA_USU
		;;
		2)
		usuario=$(dialog --stdout --title "SIA - DEL USUARIO" --inputbox "Informe o login do usuário que deseja remover:" 0 0)
		userdel $usuario
		SIA_USU
		;;
		3)
		grupo=$(dialog --stdout --title "SIA - ADD GRUPO" --inputbox "Informe o nome do grupo que deseja adicionar:" 0 0 )
		groupadd $grupo 
		SIA_USU
		;;
		4)
		grupo=$(dialog --stdout --title "SIA - DEL GRUPO" --inputbox "Informe o nome do grupo que deseja remover:" 0 0 )
		groupdel $grupo 
		SIA_USU
		;;
		5)
		usuario=$(dialog --stdout --title "SIA - CONSULTA USUARIO" --inputbox "Informe o nome do usuario que deseja consultar:" 0 0 )
		lista=$(cat /etc/passwd | grep $usuario)
		dialog --stdout --title "SIA CONSULTA USUARIO" --msgbox "$lista" 0 0
		SIA_USU
		;;
		6)
		SIA_USU
		;;			
		7) sh $(pwd)/sia.sh
		
		#read -p "Pressione um teclara para continuar" teclado	
	esac

}
	
SIA_USU


