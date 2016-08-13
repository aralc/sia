!/bin/bash
### SIA - System Infra Admin
### AUTOR : Marcos Moraes
### E-MAIL: mthiago.info@gmail.com	  
### Data : 09/08/2016

SIA_ARQ(){
optD=$(dialog --stdout --title "SIA - INFORMACOES DE SISTEMA " --menu "Informcoes Sistema" 0 0 0 \
1 "Ler Arquivo" \
2 "Alterar Arquivo" \
3 "Voltar ")
	case $optD in 
		1)
		ler=$(dialog --stdout --title "SIA - ARQUIVO" --fselect "/etc/" 0 0)
		dialog --stdout --title "SIA - Calendario" --textbox "$ler" 0 0
		SIA_ARQ
		;;
		2)
		dialog --stdout --title "Sia - Arquiterura" --msgbox "tem que fazer " 0 0
		SIA_ARQ
		;;
		7) sh $(pwd)/sia.sh
		
		#read -p "Pressione um teclara para continuar" teclado	
	esac

}
	
SIA_ARQ





