!/bin/bash
### SIA - System Infra Admin
### AUTOR : Marcos Moraes
### E-MAIL: mthiago.info@gmail.com	  
### Data : 09/08/2016

SIA_DIS(){
optD=$(dialog --stdout --title "SIA - INFORMACOES DE SISTEMA " --menu "Informcoes Sistema" 0 0 0 \
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
		;;
		2)
		touch cpu.info ;cat /proc/cpuinfo >> cpu.info
		dialog --stdout --title "SIA - Processador" --textbox "cpu.info" 0 0
		;;	
		3)
		touch mem.info ;cat /proc/meminfo >> mem.info
		dialog --stdout --title "Sia - Memoria" --textbox "mem.info" 0 0
		;;
		4)
		tempoA=$(uptime | awk {'print $3'} | cut -d , -f 1)
		dialog --stdout --title "Sia - Tempo Ativo" --msgbox "$tempoA" 0 0
		;;
		5)
		hora=$(date +"%H:%M:%S")
		dialog --stdout --title "Sia - Hora" --msgbox "$hora" 0 0
		;;
		6)
		arq=$(getconf -a | grep LONG_BIT | awk '{print $2}')
		dialog --stdout --title "Sia - Arquiterura" --msgbox "$arq bits" 0 0
		;;
		7) sh $(pwd)/sia.sh
		
		#read -p "Pressione um teclara para continuar" teclado	
	esac

}
	
SIA_DIS





