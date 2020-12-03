#!/bin/bash
user=`users`

PASSWORD="unipe"
LOGIN_USER="aluno"
LOGS=/var/log/arquivo.log

echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Iniciou o sistema ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOGS
programa=$(zenity --title="inserir login e senha" --password --username)






if [ $? != 0 ]
then
	exit 0

else
if [ '$programa' = '|' ]
then
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Não digitou login e senha ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOGS
	/home/$user/util_disk/./senha2.sh
else

USUARIO=`echo $programa | cut -d "|" -f 1`
SENHA=`echo $programa |  cut -d "|" -f 2`


if [ "$LOGIN_USER $PASSWORD"  =  "$USUARIO $SENHA" ]

then
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Digitou corretamente login e senha ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOGS
	zenity --info --title=" "  --text="Bem vindo Administrador do sistema! Iniciando programa shell."
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Acessou o sistema para executar funcões de adminitrador ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOGS
	/home/$user/util_disk/./teste.sh


else


	for i in $(zenity --error --title=" " --text="Você não tem permissões para acessar o sistema!") ;
do
	$i

done	
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Errou login e senha adminitrativa ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOGS
	/home/$user/util_disk/./senha2.sh

#done

  fi
 fi
fi


