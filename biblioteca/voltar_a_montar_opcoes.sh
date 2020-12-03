###########################
#CAPTURA DA DATA ATUAL    #
###########################
data=`date +%d-%m-%Y.%T`  #
###########################


##########################
#CAPTURA DO USUÁRIO ATUAL#
user=`users` #############
##########################

################################################################
#CAPTURA DO ULTIMO DISPOSITIVO. nome real####[exemplo]################
dispositivo=`fdisk -l | grep /media/$user | cut -d / -f 6 | tail -1` #
######################################################################

######################################################################################
#CAPTURA DO SISTEMA DA PARTIÇÃO.##nome do dispositivo[sda, sdb,sdc]###################
dispositivo_novo=`fdisk -l | grep "^/dev/" | cut -c6-14 | cut -d " " -f 1 | tail -1` #
######################################################################################

########################################################################################################
#CAPTURA DO DISPOSITVO X ESPECÍFICO##############[sda, sdb ou sdc]#################################################
dispositivo_x_especifico_montado=`fdisk -l | grep "$dispositivo_novo" | cut -c6-14 | cut -d " " -f 1 | tail -1` ###
###################################################################################################################


#########################################################################
#Esse código é para voltar para a lista do dispositivo novo selecionado.#
#########################################################################


novo_dispositivo=`fdisk -l | grep "^/dev/" | cut -c6-8 | cut -d " " -f 1 | tail -1`
dispositivo_sda=`fdisk -l | grep "^/dev/sda" | cut -c6-8 | cut -d " " -f 1 | tail -1`

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
#######################################################################################################################
#[OUTRA PARTE DO CÓDIGO]#######################[OUTRRA PARTE DO CÓDIGO]################################################
#######################################################################################################################

	zenity --question --cancel-label="Não, voltar." --ok-label="Sim, montar." --title=" " --text="Deseja realmente montar o dispositivo?" --width=300 --height=250

#esse é o botão do questionamento "--ok-label=Sim, montar"

if [ $? = 0 ]
then
	vazio=" "
	nome_da_pasta_criada=`zenity --entry --title="Ponto de montagem do dispositivo" --text="Digite o nome da pasta" --width=300 --height=250`

if [ $nome_da_pasta_criada = $vazio ]
then
        zenity --warning --title=" " --text="Nenhum diretório foi criado. Por motivo de segurança dos dados o progama será encerrado!" --width=300 --height=250
        exit 0
else


	mkdir -p /media/$user/"$nome_da_pasta_criada" ;
	mount -t auto /dev/$dispositivo_x_especifico_montado /media/$user/"$nome_da_pasta_criada"
	zenity --info --title=" " --text="O dispositivo \"$dispositivo_novo\" foi montado nesta pasta \"$nome_da_pasta_criada\"" --width=300 --height=250
	zenity --question --title=" " --text="Deseja sair do sistema ou voltar para o inicio?" \
--cancel-label="Sair do programa"  --ok-label="Voltar ao inicio" --width=300 --height=250

fi

#esse é o botão de questionamento "Não, Voltar."

else
	zenity --info --title=" " --text='Você clicou em: "Não, voltar.", deseja sair do programa? Preciso que confirme.' --width=300 --height=250
	zenity --question --cancel-label="Sair do programa"  --ok-label="Montar" --text="Deseja sair do programa ou voltar montar o dispositivo \"$dispositivo\"?" --width=300 --height=250

if [ $? = 0 ]
then

	/home/$user/util_disk/biblioteca/./voltar_a_desmontar_opcoes.sh
else
	exit 0

  fi

fi
#esse é o botão após montar o que fzer voltar ao inicio ou encerra o programa?
if [ $? = 0 ]
then
	/home/$user/util_disk/./teste.sh
else
	exit 0
  fi
fi

