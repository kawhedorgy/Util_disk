##########################
#CAPTURA DO USUÁRIO ATUAL#
user=`users` #############
##########################

###############################
LOGS=/var/log/arquivo.log #####
###############################

################################################################
#CAPTURA DO ULTIMO DISPOSITIVO. nome real####[exemplo]##########
dispositivo=`df | grep /media/$user | cut -d / -f 6 | tail -1` #
################################################################

############################################################################
#CAPTURA DO SISTEMA DE ARQUIVOS.##nome do dispositivo[sda, sdb,sdc]#########
dispositivo_novo=`df | grep "$dispositivo" | cut -c6-14 | cut -d " " -f 1` #
############################################################################


#########################################################################
#Esse código é para voltar para a lista do dispositivo novo selecionado.#
#########################################################################


novo_dispositivo=`df | grep "^/dev/" | cut -c6-8 | cut -d " " -f 1 | tail -1`
dispositivo_sda=`df | grep "^/dev/sda" | cut -c6-8 | cut -d " " -f 1 | tail -1`

if [ $novo_dispositivo = $dispositivo_sda ]

then
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Despositivo não encontrado ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOGS
        zenity --warning --text="Nenhum dispositivo novo foi encotrado! Favor inserir dispositivo para ser listado."
        echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Voltou para o início do programa ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOGS
	zenity --question --ok-label=Sair --cancel-label=Voltar --text="Deseja voltar ao inicio ou sair do progrma?"

if [ $? != 0 ]
then
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Voltou para o início do programa ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOGS
        /home/$user/util_disk/./teste.sh # botão voltar

else
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Encerrou o programa ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOGS
        exit 0

fi

else
#######################################################################################################################
#[OUTRA PARTE DO CÓDIGO]#######################[OUTRRA PARTE DO CÓDIGO]################################################
#######################################################################################################################

	zenity --question --cancel-label="Não, voltar." --ok-label="Sim, desmontar." --title=" " --text="Deseja realmente desmontar o dispositivo?" --width=300 --height=300

#esse é o botão do questionamento "--ok-label=Sim, desmontar"

if [ $? = 0 ]
then
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Desmontagem do dispositivo \"$dispositivo\" ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOGS
	umount /dev/$dispositivo_novo
	zenity --info --title=" " --text="O dispositivo $dispositivo foi desmontado!" --width=300 --height=250
	zenity --question --title=" " --text="Deseja sair do sistema ou voltar para o inicio e montar?" \
--cancel-label="Sair do programa"  --ok-label="Voltar ao inicio"

#esse é o botão de questionamento "Não, Voltar."

else
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Clicou em voltar para informação do sistema ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOGS
	zenity --info --title=" " --text='Você clicou em: "Não, voltar.", deseja sair do programa? Preciso que confirme.' --width=300 --height=250
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === informação do sistema: sair ou não ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOGS
zenity --question --cancel-label="Sair do programa"  --ok-label="Voltar a desmontar" --text="Deseja sair do programa ou voltar desmontar o dispositivo?" --width=300 --height=250

if [ $? = 0 ]
then

	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Clicou em voltar a montar \"$dispositivo_novo\" ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOGS
	/home/$user/util_disk/biblioteca/./voltar_a_desmontar_opcoes.sh
else
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Encerrou o programa ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOGS
	exit 0

  fi

fi
#esse é o botão após montar o que fzer voltar ao inicio ou encerra o programa?
if [ $? = 0 ]
then
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Voltar para o início do programa ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOGS
	/home/$user/util_disk/./teste.sh
else
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Encerrou o programa ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOGS
	exit 0
  fi
fi

