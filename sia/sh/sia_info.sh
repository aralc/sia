#!/bin/bash
### SIA - System Infra Admin
### AUTOR : Marcos Moraes
### E-MAIL: mthiago.info@gmail.com	  
### Data : 09/08/2016
DIRCONF=/opt/sia/etc 
DIREXE=/opt/sia/sh
DIRARQ=/opt/sia/info
DIRTEMP=/opt/sia/tmp
site=$(cat $DIRCONF/sia.conf | grep site | cut -d "=" -f 2)
	SIA_INFO(){
	optD=$(dialog --stdout --title "SIA - INFORMACOES DE SISTEMA " --backtitle "$site" --menu "Informcoes Sistema" 0 0 0 \
		1 "Calendario" \
		2 "Processador" \
		3 "Memoria" \
		4 "Tempo aitvo" \
		5 "Horas sistema" \
		6 "Arquiterura" \
		7 "Info SIA" \
		8 "Voltar" )
		case $optD in 
			1)
			dialog --stdout --title "SIA - Calendario" --calendar "mes" 0 0
			SIA_INFO
			;;
			2)
			touch $DIRARQ/cpu.info ;cat /proc/cpuinfo >> $DIRARQ/cpu.info
			dialog --stdout --title "SIA - Processador" --textbox "$DIRARQ/cpu.info" 0 0
			rm -rf $DIRARQ/cpu.info
			SIA_INFO
			;;	
			3)
			touch $DIRARQ/mem.info ;cat /proc/meminfo >> $DIRARQ/mem.info
			dialog --stdout --title "Sia - Memoria" --textbox "$DIRARQ/mem.info" 0 0
			rm -rf $DIRARQ/mem.info
			SIA_INFO
			;;
			4)
			tempoA=$(uptime | awk {'print $3'} | cut -d , -f 1)
			dialog --stdout --title "Sia - Tempo Ativo" --msgbox "$tempoA" 0 0
			SIA_INFO
			;;
			5)
			hora=$(date +"%H:%M:%S")
			dialog --stdout --title "Sia - Hora" --msgbox "$hora" 0 0
			SIA_INFO
			;;
			6)
			arq=$(getconf -a | grep LONG_BIT | awk '{print $2}')
			dialog --stdout --title "Sia - Arquiterura" --msgbox "$arq bits" 0 0
			SIA_INFO
			;;
			7)
			siainfo=$(cat $DIRCONF/sia.conf | cut -d "=" -f 2)
			dialog --stdout --title "Sia - Informações" --msgbox "$siainfo" 0 0
			SIA_INFO
			;;

			8) bash $DIREXE/sia.sh
			esac
			}
			trap SIA_INFO 2 20	
			SIA_INFO





