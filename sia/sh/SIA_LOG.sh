#!/bin/bash
## ler arquivos
DIREXE=/opt/sia/sh
SIA_LOG()
{
opt=$(dialog --stdout --title "SIA_LOG" --radiolist "Qual log deseja ler:" 0 0 0  \
	/var/log/auth.log 'log ler autenticacao' off \
	/var/log/syslog 'log geral sistema' off \
	/var/log/sia/sia.log 'log sia' on ) 
dialog --stdout --title "ler arquivos" --textbox "$opt" 0 0
}
trap SIA_LOG 2 20
SIA_LOG

