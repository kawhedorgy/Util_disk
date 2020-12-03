###########################
#CAPTURA DA DATA ATUAL    #
###########################
data=`date +%d-%m-%Y.%T`  #
###########################

###########################
LOG=/var/log/arquivo.log  #
###########################
###########################
#CAPTURA DO USUÁRIO ATUAL##
###########################
user=`users` #
##############

#CAPTURA DO ULTIMO DISPOSITIVO.
################################################################
dispositivo=`df | grep /media/$user | cut -d / -f 6 | tail -1` #
################################################################

#CAPTURA DO SISTEMA DE ARQUIVOS.
############################################################################
dispositivo_novo=`df | grep "$dispositivo" | cut -c6-14 | cut -d " " -f 1` #
############################################################################


novo_dispositivo=`df | grep "^/dev/" | cut -c6-8 | cut -d " " -f 1 | tail -1`
dispositivo_sda=`df | grep "^/dev/sda" | cut -c6-8 | cut -d " " -f 1 | tail -1`

if [ $novo_dispositivo = $dispositivo_sda ]

then
	zenity --warning --text="Nenhum dispositivo novo foi encotrado! Favor inserir dispositivo para ser listado."
        zenity --question --ok-label=Sair --cancel-label=Voltar --text="Deseja voltar ao inicio ou sair do progrma?"

if [ $? != 0 ]
then
        /home/$user/util_disk/./teste.sh # botão voltar

else

        exit 0

fi

else

	zenity --question --cancel-label="Sair do programa." --ok-label="Sim, copiar." --title=" " --text="Deseja realmente copiar o dispositivo?" --width=300 --height=250

if [ $? = 0 ]
then

#CODIDO EM FASE EXPERIMENTAL COD EM FASE  EXPERIMENTAL


	pasta=`zenity --entry --cancel-label="Voltar" --title=" " --text="Digite o nome da pasta de BACKUP para o dispositivo \"$dispositivo\"." --width=300 --height=250`

if [ $? != 0 ]
then
        /home/$user/util_disk/./teste.sh # botão voltar

else


	mkdir -p /media/$user/"$pasta"."$dispositivo"."$data" ;
        echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Criou pasta:"$pasta"."$dispositivo"."$data" ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOG
	cp -rf /media/$user/"$dispositivo"/*  /media/$user/"$pasta"."$dispositivo"."$data" ;
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Copiou dados para a pasta:"$pasta"."$dispositivo"."$data" ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOG
        zenity --info --title=" " --text="A cópias dos arquivos do \"$dispositivo\" foram concluídas com sucesso!" --width=300 --height=250

fi

	zenity --question --title=" " --text="Deseja sair do sistema ou voltar para o inicio?" \
--cancel-label="Sair do programa"  --ok-label="Voltar ao inicio" --width=300 --height=250

if [ $? = 0 ]
then
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Na tela "copiar arquivo", clicou em voltar ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOG

        /home/$user/util_disk/./teste.sh # botão voltar
else
        exit 0
fi


else
	exit 0

  fi
fi

