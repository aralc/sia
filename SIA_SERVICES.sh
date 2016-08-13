#!/bin/bash
### SIA - System Infra Admin
### AUTOR : Marcos Moraes
### E-MAIL: mthiago.info@gmail.com	  
### Data : 09/08/2016

SIA_DIS(){
optD=$(dialog --stdout --title "SIA - INFORMACOES DE SISTEMA " --menu "Informcoes Sistema" 0 0 0 \
1 "Verificar servicos" \
2 "Verificar servico especifico" \
3 "Iniciar servico" \
4 "Parar servico" \
5 "Voltar ")
	case $optD in 
		1)
		touch servico.info ; service --status-all > servico.info
		dialog --stdout --title "SIA - SERVICES" --textbox "servico.info" 0 0
		;;
		2)
		servico=$(dialog --stdout --title "SIA - SERVICES" --inputbox "informe o nome do servico" 0 0)
		servico_esp=$(service $servico status)
		dialog --stdout --title "SIA - SERVICES" --msgbox "$servico_esp" 0 0
		;;	
		3)
		servico=$(dialog --stdout --title "SIA - SERVICE" --inputbox "Informe o nome do servico:" 0 0)
		service $servico start
		dialog --stdout --title "SIA SERVICES" --msgbox "Servico Iniciado" 0 0
		;;
		4)
		servico=$(dialog --stdout --title "SIA - SERVICES" --inputbox "Informe o nome do servico" 0 0)
		service $servico stop
		dialog --stdout --title "SIA - SERVICES" --msgbox "Servico Finalizado" 0 0
		;;
		5) sh $(pwd)/sia.sh
		
		#read -p "Pressione um teclara para continuar" teclado	
	esac

}
	
SIA_DIS





