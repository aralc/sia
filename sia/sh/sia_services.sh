#!/bin/bash
### SIA - System Infra Admin
### AUTOR : Marcos Moraes
### E-MAIL: mthiago.info@gmail.com	  
### Data : 09/08/2016
DIREXE=/opt/sia/sh
DIRARQ=/opt/sia/info
	getData()
	{
	data=$(date +"%D/%M/%Y-%H:%M:%S")
	}

		SIA_SER(){
			optD=$(dialog --stdout --title "SIA - INFORMACOES DE SISTEMA " --backtitle "http://www.bacteriadebits.com.br" --menu "Informcoes Sistema" 0 0 0 \
			1 "Verificar servicos" \
			2 "Verificar servico especifico" \
			3 "Iniciar servico" \
			4 "Parar servico" \
			5 "Voltar ")
			case $optD in 
				1)
				touch $DIRARQ/servico.info ; sudo service --status-all > servico.info
				dialog --stdout --title "SIA - SERVICES" --textbox "servico.info" 0 0
				SIA_SER
				;;
				2)
				servico=$(dialog --stdout --title "SIA - SERVICES" --inputbox "informe o nome do servico" 0 0)
				servico_esp=$(sudo service $servico status)
				dialog --stdout --title "SIA - SERVICES" --msgbox "$servico_esp" 0 0
				SIA_SER
				;;	
				3)
				servico=$(dialog --stdout --title "SIA - SERVICE" --inputbox "Informe o nome do servico:" 0 0)
				sudo service $servico start
				getData
				echo "$data -- Servico $servico iniciado" >> /var/log/sia/sia.log
				dialog --stdout --title "SIA SERVICES" --msgbox "Servico Iniciado" 0 0
				SIA_SER
				;;
				4)
				servico=$(dialog --stdout --title "SIA - SERVICES" --inputbox "Informe o nome do servico" 0 0)
				sudo service $servico stop
				getData
				echo "$data -- Servico $servico finalizado"
				dialog --stdout --title "SIA - SERVICES" --msgbox "Servico Finalizado" 0 0
				SIA_SER
				;;
				5) bash $DIREXE/sia.sh
		
				esac

				}
					trap SIA_SER 2 20
					SIA_SER
	




