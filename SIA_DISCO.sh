#!/bin/bash
### SIA - System Infra Admin
### AUTOR : Marcos Moraes
### E-MAIL: mthiago.info@gmail.com	  
### Data : 09/08/2016

SIA_DIS(){
optD=$(dialog --stdout --title "SIA - ADMIN DISCO" --menu "Administracao Disco" 0 0 0 \
1 "Analise disco a disco" \
2 "Visao geral disco" \
3 "Voltar ")
	case $optD in 
		1)
		disco=$(df -h | awk '{print $1}')
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
		dialog --stdout --title "SIA - ADMIN DISCO" --msgbox "O disco :: ${d[$i]} Percentual de uso:: ${disco_tam[$i]}" 0 0 
		done 
		;;			
		3) sh $(pwd)/sia.sh
		
		#read -p "Pressione um teclara para continuar" teclado	
	esac

}
	
SIA_DIS

#db=lpi
#table=lpi101
#user=root



	#begin 0 0 de acordo com a largura 
#nome=$(dialog --stdout --title "lpi" --inputbox "Qual o nome do aluno: " 0 0)
#nota=$(dialog --stdout --title "lpi" --inputbox "Qual a nota do aluno" 0 0)
#mysql -u $user -pbankai -e "insert into $table (nome,nota) values ('$nome',$nota)" $db
#dialog --stdout --title "LPI" --msgbox "Aluno $nome inserido no $db" 0 0
	
