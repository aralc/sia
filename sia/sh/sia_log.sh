#!/bin/bash
## ler arquivos
DIREXE=/opt/sia/sh
DIRTEMP=/opt/sia/tmp

#verificar versao do sistema operacional

V_SO()
{
	t=$(lsb_release -i | grep Distrib | cut -d ":" -f 2)
#	dialog --stdout --title "teste 1" --infobox "$t" 0 0 
		if test $t == "Debian"
			then 
				log="syslog"
				#dialog --stdout --title "teste" --msgbox "$log" 0 0 
			else	
				log="anaconda.log"
		#		dialog --stdout --title "teste3" --msgbox "$log" 0 0 
		fi

}

SIA_LOG()
{
#dist="teste"
V_SO
opt=$(dialog --stdout --title "SIA LOG" --radiolist "Qual log deseja ler:" 0 0 0  \
	/var/log/messages 'Log messages' off \
	/var/log/$log 'log geral sistema' off \
	/var/log/sia/sia.log 'log sia' on ) 

#sudo cat $opt >> $DIRTEMP/log.tmp
#ler=$(cat $DIRTEMP/log.tmp)

if [ $opc -eq  " " ]
then 
	dialog --stdout --title "ERROR" --msgbox "ERROR" 0 0
else
	sudo dialog --stdout --title "SIA LOG" --textbox "$opt" 0 0
fi
}
trap SIA_LOG 2 20
#V_SO
SIA_LOG

