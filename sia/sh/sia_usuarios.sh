#lt!/bin/bash
### SIA - System Infra Admin
### AUTOR : Marcos Moraes
### E-MAIL: mthiago.info@gmail.com	  
### Data : 09/08/2016
### Atualização : 18/06/2017
##############################################

##############################################
# Diretorios de trabalho 		     #
##############################################
DIREXE=/opt/sia/sh
DIRTEMP=/opt/sia/tmp
##############################################

##############################################
# FUNCOES GERAIS
#############################################

	alterPasswd()
	{
	
	listar()
	{
	lista=$(cat /etc/passwd | cut -d ":" -f1-6 | grep home | cut -d ":" -f1 ) 
	touch $DIRTEMP/lista
	for usu in $lista
	do
	echo $usu   
	done
	}
	
	listar	>> $DIRTEMP/lista
	opt=$(dialog --stdout --title "SIA - ADMIN USUARIO" --msgbox "$(cat $DIRTEMP/lista)" 0 0 )
	usuario=$(dialog --stdout --title "SIA - ADMIN USUARIO" --inputbox "Informe o login:" 0 0 )
	senha=$(dialog --stdout --title "SIA - ADMIN USUARIO" --passwordbox "Informe a senha:" 0 0 )
		if [ $usuario = "" || $senha = "" ]
			then
			opt=$(dialog --stdout --title "SIA - ADMIN USUARIo" --msgbox "Erro, usuario ou senha nao pode ser vazio" 0 0 )
			alterPasswd
		 else 
			echo $usuario:$senha | chpasswd
			rm -rf $DIRTEMP/lista
		fi
	
	}


	getData()
	{
	data=$(date +"%d/%m/%y-%H:%M:%S")
	}

# FIM FUNCOES GERAIS

#
	SIA_USU(){
		optU=$(dialog --stdout --title "SIA - ADMIN USUARIO" --backtitle "http://www.bacteriadebits.com.br" --menu "Administracao Usuario" 0 0 0 \
		1 "Criar usuario" \
		2 "Remover usuario" \
		3 "Criar grupo" \
		4 "Remover grupo" \
		5 "Consultar usuario" \
		6 "Consutlar grupo" \
		7 "Alterar senha" \
		8 "Voltar ")
			case $optU in 
				1)
				usuario=$(dialog --stdout --title "SIA - ADD USUARIO" --inputbox "Informe o login:" 0 0)
				sudo useradd $usuario
				senha=$(dialog --stdout --title "SIA - ADD USUARIO" --passwordbox "Informe a senha:" 0 0)
					echo $usuario:$senha | sudo chpasswd #alterado incluir sudo 
					getData
					echo "$data -- $usuario adicionado com a senha $senha" >> /var/log/sia/sia.log
					SIA_USU
				;;
			
				2)
				usuario=$(dialog --stdout --title "SIA - DEL USUARIO" --inputbox "Informe o login do usuário que deseja remover:" 0 0)
				sudo userdel $usuario
					getData
	        		        echo "$data -- $usuario deletado" >> /var/log/sia/sia.log
					SIA_USU
				;;
			
				3)
				grupo=$(dialog --stdout --title "SIA - ADD GRUPO" --inputbox "Informe o nome do grupo que deseja adicionar:" 0 0 )
				sudo groupadd $grupo  #alteracao incluir sudo 
					getData
					echo "$data --GRUPO $grupo adicionado" >> /var/log/sia.log
					SIA_USU
				;;

				4)
				grupo=$(dialog --stdout --title "SIA - DEL GRUPO" --inputbox "Informe o nome do grupo que deseja remover:" 0 0 )
				sudo groupdel $grupo #alteracao incluir sudo 
					getData
					echo "$data --GRUPO $grupo deletado" >> /var/log/sia.log
					SIA_USU
				;;

				5)
				usuario=$(dialog --stdout --title "SIA - CONSULTA USUARIO" --inputbox "Informe o nome do usuario que deseja consultar:" 0 0 )
				lista=$(cat /etc/passwd | grep $usuario)
				dialog --stdout --title "SIA CONSULTA USUARIO" --msgbox "$lista" 0 0
					SIA_USU
				;;

				6)
				dialog --stdout --title "SIA - ERROR" --msgbox "ERROR - function error"
				;;
	
				7)
				dialog --stdout --title "SIA - ERROR" --msgbox "ERROR - function error"
					alterPasswd
					SIA_USU
					;;

				8) bash $DIREXE/sia.sh
				esac
				}
				trap SIA_USU 2 20	
				SIA_USU


