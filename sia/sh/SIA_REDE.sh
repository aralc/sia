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
		touch $DIRARQ/rede.info ; ifconfig > $DIRARQ/rede.info
		dialog --stdout --title "SIA - REDES" --textbox "$DIRARQ/rede.info" 0 0
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
		touch $DIRARQ/rota.info; ip route show > /$DIRARQ/rota.info
		dialog --stdout --title "SIA - REDE" --textbox "$DIRARQ/rota.info" 0 0 
		SIA_REDE
		;;
		5)
		rotadestino=$(dialog --stdout --title "SIA-REDE" --inputbox "Informe o destino para rota 0.0.0.0/0" 0 0)
		rotasaida=$(dialog --stdout --title "SIA - REDE" --inputbox "Informe a rota de saida 0.0.0.0" 0 0)
		dispositivo=$(dialog --stdout --title "SIA - REDE" --inputbox "Informe o dispositivo de rede " 0 0)
		sudo ip route add $rotadestino via $rotasaida dev $dispositivo
		data=$(date +"%d/%m/%-%H:%M:%S")
		echo "$data - rota para $rotadestino adiciona com saida pra $rotasaida" >> /var/log/sia/sia.log
		;;
		6)
		rotadestino=$(dialog --stdout --title "SIA - REDE" --input "Informe a rota que deseja excluir 0.0.0.0/24" 0 0)
		sudo ip route delete $rotadestino
		data=$(date +"%d/%m/%y-%H:%M:%S")
		echo "$data - rota $rotadestino deleta por $(whoami)" >> /var/log/sia/sia.log
		;;
		7)
		novo=$(dialog --stdout --title " SIA REDE " --backtitle "DNS" --editbox "/etc/resolv.conf" 0 0)
		touch $DIRTEMP/resolv.novo ; echo "$novo" > $DIRTEMP/resolv.novo
		dialog --stdout --title "SIA REDE" --textbox "etc/resolv.conf" 0 0
		rm -rf /etc/resolv.conf
		mv $DIRTEMP/resolv.novo /etc/resolv.conf 
		$data=$(date + "%d/%m/%y-%H:%M:%S")
		echo  "$data - Dns alterado por $(whoami)"
		SIA_REDE
		;;
		8) bash $DIREXE/sia.sh
		
	esac

}
trap SIA_REDE 2 20	
SIA_REDE





