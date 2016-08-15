#!/bin/bash
### SIA - System Infra Admin
### AUTOR : Marcos Moraes
### E-MAIL: mthiago.info@gmail.com	  
### Data : 09/08/2016
DIREXE=/opt/sia/sh
DIRARQ=/opt/sia/info
DIRTEMP=/opt/sia/tmp

SIA_INFO(){
optD=$(dialog --stdout --title "SIA - INFORMACOES DE SISTEMA " --backtitle "http://www.bacteriadebits.com.bru" --menu "Informcoes Sistema" 0 0 0 \
1 "Calendario" \
2 "Processador" \
3 "Memoria" \
4 "Tempo aitvo" \
5 "Horas sistema" \
6 "Arquiterura" \
7 "Voltar ")
	case $optD in 
		1)
		dialog --stdout --title "SIA - Calendario" --calendar "mes" 0 0
		SIA_INFO
		;;
		2)
		#altera o caminho de geracao do arquivo TMP
		touch $DIRARQ/cpu.info ;cat /proc/cpuinfo >> $DIRARQ/cpu.info
		dialog --stdout --title "SIA - Processador" --textbox "$DIRARQ/cpu.info" 0 0
		SIA_INFO
		;;	
		3)
		#altera o caminho de geracao de arquivo TMP
		touch $DIRARQ/mem.info ;cat /proc/meminfo >> $DIRARQ/mem.info
		dialog --stdout --title "Sia - Memoria" --textbox "$DIRARQ/mem.info" 0 0
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
		#alterar o caminho de chamada 
		7) bash $DIREXE/sia.sh
		
	esac

}
trap SIA_INFO 2 20	
SIA_INFO





