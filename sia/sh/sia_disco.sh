#!/bin/bash
### SIA - System Infra Admin
### AUTOR : Marcos Moraes
### E-MAIL: mthiago.info@gmail.com	  
### Data : 09/08/2016
DIREXE=/opt/sia/sh
DIRARQ=/opt/sia/info
DIRTEMP=/opr/sia/tmp
	SIA_DIS(){
		optD=$(dialog --stdout --title "SIA - ADMIN DISCO" --backtitle "http://www.bacteriadebits.com.br" --menu "Informacoes de Disco" 0 0 0 \
		1 "Analise disco a disco" \
		2 "Visao geral disco" \
		3 "Voltar ")
		case $optD in 
			1)
			disco=$(df -h | awk '{print $6}' | cut -d "/" -f2)
			discoT=$(df -h | awk '{print $5}')
			for dis in $disco
			do
			cont=$(expr $cont + 1)		
			echo ${d[$cont]}
			d[$cont]=$dis
			done				
		
			for dist in $discoT
			do
			cont2=$(expr $cont2 + 1)
			disco_tam[${cont2}]=$dist
			done
		
			tam=$(df -h | wc -l)
			echo $tam
			i=0
			while [ $i -lt $tam ]
			do
			i=$(expr $i + 1)			
			dialog --stdout --title "SIA - ADMIN DISCO" --msgbox "Disco ::: ${d[$i]} | Percentual de uso ::: ${disco_tam[$i]}" 6 50 
			done 
			;;
		2)
		disco=$(df -h | tr [a-z] [A-Z])
		dialog --stdout --title "SIA - ADMIN DISCO" --msgbox "$disco" 0 0			
		;;
		3) bash $DIREXE/sia.sh
		
	esac

}

trap SIA_DIS 2 20	
SIA_DIS





