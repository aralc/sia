#!/bin/bash
### SIA - System Infra Admin
### AUTOR : Marcos Moraes
### E-MAIL: mthiago.info@gmail.com	  
### Data : 09/08/2016
DIREXE=/opt/sia/sh
DIRARQ=/opt/sia/info
DIRTEMP=/opt/sia/tmp
SIA_REDE(){
optD=$(dialog --stdout --title "SIA - REDE " --backtitle "http://www.bacteriadebits.com.br" --menu "Informcoes Sistema" 0 0 0 \
1 "Verificar configuracao de rede" \
2 "Verificar configuracao de rede especifica" \
3 "Verificar comunicacao" \
4 "Verificar rotas" \
5 "Aicionar Rota" \
6 "Remover  Rota" \
7 "Alterar DNS" \
8 "Voltar" )


	case $optD in 
		1)
		touch $DIRARQ/rede.info ; ifconfig > rede.info
		dialog --stdout --title "SIA - REDES" --textbox "rede.info" 0 0
		rm -rf rede.info
		SIA_REDE
		;;
		2)
		rede=$(dialog --stdout --title "SIA - REDE" --inputbox "informe o nome do dispositivo de rede:" 0 0)
		rede_esp=$(ifconfig $rede)
		dialog --stdout --title "SIA - REDES" --msgbox "$rede_esp" 0 0
		SIA_REDE
		;;	
		3)
		teste=$(dialog --stdout --title "SIA - REDE" --inputbox "Informe um enderoço de rede valido para teste:" 0 0)
		teste_esp=$(ping -c 3 $teste)
		dialog --stdout --title "SIA REDE" --msgbox "$teste_esp" 0 0
		SIA_REDE
		;;
		4)
		touch $DIRARQ/rota.info; ip route show > roda.info
		dialog --stdout --title "SIA - REDE" --textbox "roda.info" 0 0 
		SIA_REDE
		;;
		5)
		dialog --stdout --title "SIA-REDE" --msgbox "Tem que fazer ainda " 0 0
		;;
		6)
		dialog --stdout --title " SIA REDE " --msgbox "tem que fazer ainda " 0 0
		;;
		7)
		novo=$(dialog --stdout --title " SIA REDE " --backtitle "DNS" --editbox "/etc/resolv.conf" 0 0)
		touch $DIRTEMP/resolv.novo ; echo "$novo" > resolv.novo
		dialog --stdout --title "SIA REDE" --textbox "resolv.novo" 0 0
		SIA_REDE
		;;
		8) bash $DIREXE/sia.sh
		
	esac

}
trap SIA_REDE 2 20	
SIA_REDE





