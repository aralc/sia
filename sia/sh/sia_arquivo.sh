#!/bin/bash
### SIA - System Infra Admin
### AUTOR : Marcos Moraes
### E-MAIL: mthiago.info@gmail.com	  
### Data : 09/08/2016
### Atualizacao : acrescentado arquivo de configuracao 
### 22/02/2017

DIRCONF=/opt/sia/etc
DIREXE=/opt/sia/sh
DIRARQ=/opt/sia/info
DIRTEMP=/opt/sia/tmp

site=$(cat $DIRCONF/sia.conf | grep "site" | cut -d "=" -f 2)

		SIA_ARQ(){
		optA=$(dialog --stdout --title "SIA - ARQUIVOS " --backtitle "$site" --menu "Informcoes Sistema" 0 0 0 \
			1 "Ler Arquivo" \
			2 "Informacao sobre arquivo" \
			3 "Detalhes sobre arquivo" \
			4 "Encontrar arquivo" \
			5 "Voltar" ) 
			case $optA in 
				1)
				#faz a leitura de arquivos para analise 
				ler=$(dialog --stdout --title "SIA - ARQUIVOS" --fselect "/etc/" 0 0)
				dialog --stdout --title "SIA - ARQUIVOS" --textbox "$ler" 0 0
				SIA_ARQ	
				;;
				2) 
				#informacoes sobre arquivo 
				ler=$(dialog --stdout --title "SIA - ARQUIVOS" --fselect "/" 0 0)
				ler2=$(file $ler)
				dialog --stdout --title "SIA - ARQUIVOS" --ok-label "ok" --msgbox "$ler2"  0 0
				SIA_ARQ
				;;
				3) 
				#detalhes sobre arquivo 
				ler=$(dialog --stdout --title "SIA - ARQUIVO" --fselect "/" 0 0)
				ler3=$(stat $ler)
				dialog --stdout --title "SIA - ARQUIVO" --ok-label "ok" --msgbox "$ler3" 0 0
				SIA_ARQ
				;;
				4)
				#procurar arquivo 
				ler=$(dialog --stdout --title "SIA - ARQUIVO" --inputbox "O que voce procura" 0 0)
				ler4=$(sudo find / -name $ler)
				dialog --stdout --title "SIA ARQUIVO" --ok-label "ok" --msgbox "$ler4" 0 0
				SIA_ARQ
				;;
				
			5) bash $DIREXE/sia.sh
		esac

		}

	trap SIA_ARQ 2 20 	
		SIA_ARQ





