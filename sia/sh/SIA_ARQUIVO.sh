#!/bin/bash
### SIA - System Infra Admin
### AUTOR : Marcos Moraes
### E-MAIL: mthiago.info@gmail.com	  
### Data : 09/08/2016
DIREXE=/opt/sia/sh
DIRARQ=/opt/sia/info
DIRTEMP=/opt/sia/tmp
SIA_ARQ(){
optA=$(dialog --stdout --title "SIA - ARQUIVOS " --backtitle "http://www.bacteriadebits.com.br" --menu "Informcoes Sistema" 0 0 0 \
1 "Ler Arquivo" \
2 "Alterar Arquivo" \
3 "Voltar ")
	case $optA in 
		1)
		#faz a leitura de arquivos para analise 
		ler=$(dialog --stdout --title "SIA - ARQUIVOS" --fselect "/etc/" 0 0)
		dialog --stdout --title "SIA - ARQUIVOS" --textbox "$ler" 0 0
		SIA_ARQ
		;;
		2)
		quem=$(whoami)
		#faz a alteracao de arquivos, importante ter permissao especial para fazer isto.
		if test "$quem" = "root"
			then 
			dialog --stdout --title "SIA - ARQUIVOS" --msgbox "OK você pode fazer alteracoes de arquivos " 0 0
			#vai entrar no log 
			else 
			dialog --stdout --title "SIA - ARQUIVOS" --msgbox "Voce nao tem permissao para efeutar alteracoes nos arquivos " 0 0
			fi
		SIA_ARQ
		;;
		#alterar para diretorio inst
		7) bash $DIREXE/sia.sh
		

	esac

}
trap SIA_ARQ 2 20 	
SIA_ARQ





