#!/bin/bash
## ler arquivos
SIA_LOG()
{
opt=$(dialog --stdout --title "SIA_LOG" --radiolist "Qual log deseja ler:" 0 0 0  \
	/var/log/auth.log 'log ler autenticacao' on \
	/var/log/syslog 'log geral sistema' off \
	/etc/passwd 'arquivo usuarios' off \
	/etc/shadow 'arquivo de senha sde usuarios' off )
dialog --stdout --title "ler arquivos" --textbox "$opt" 0 0
}
SIA_LOG
