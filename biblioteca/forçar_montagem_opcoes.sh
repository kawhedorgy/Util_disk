##############
user=`users` #
##############
############################
LOG=/var/log/arquivo.log  #
############################

#######################################################################################
#sitema_de_arquivo=`blkid | grep -i /dev/ | cut -d " " -f 5 | cut -c7-10 | tail -1`   #
#######################################################################################

################################################################
#CAPTURA DO ULTIMO DISPOSITIVO. nome real####[exemplo]##########
dispositivo=`fdisk -l | grep /media/$user | cut -d / -f 6 | tail -1` #
################################################################

########################################################################################################
#CAPTURA DO DISPOSITVO X ESPECÍFICO########[sda, sdb ou sdc]############################################
dispositivo_x_expecifico_montado=`fdisk -l | grep "/dev/" | cut -c6-14 | cut -d " " -f 1 | tail -1` ###
########################################################################################################

##########################################################################
uuid=`blkid | grep /dev/$dispositivo_x_expecifico_montado | cut -c18-65` #
##########################################################################


#########################################################################
#Esse código é para voltar para a lista do dispositivo novo selecionado.#
#########################################################################

######################################################################################
novo_dispositivo=`fdisk -l | grep "^/dev/" | cut -c6-8 | cut -d " " -f 1 | tail -1`  #
######################################################################################

#######################################################################################
dispositivo_sda=`fdisk -l | grep "^/dev/sda" | cut -c6-8 | cut -d " " -f 1 | tail -1` #
#######################################################################################

if [ $novo_dispositivo = $dispositivo_sda ] ;

then
        echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Ao tentar força a montagem, nenhum disitivo novo foi encotrado pelo sistema ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOG
	zenity --warning --text="Nenhum dispositivo novo foi encotrado! Favor inserir dispositivo para ser listado."  --width=300 --height=250
        zenity --question --cancel-label=Não --text="Deseja sair do programa?" --width=300 --height=250
	#/home/$user/util_disk/./teste.sh
if [ $? != 0 ]
then
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Voltou para o inicio do programa ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOG
       /home/$user/util_disk/./teste.sh # botão voltar

else
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Encerrou o programa ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOG
        exit 0 #botão de sair

fi

else

#################################
#CONTINUAÇÃO DO CÓDIGO###########
#################################



#	pasta=`zenity --forms --add-entry "Pasta" --add-list "Opção de pasta" --list-values "$dispositivo_x_expecifico_montado" \
#--title=" " --text="Digite o nome para o diretório de montagem." --width="400" --height="160"`
	pasta1=" "
	pasta=`zenity --entry  --title=" " --text="Digite o nome para o diretório de montagem." --width="400" --height="160"`

if [ $? = 0 ] ;
then
if [ $pasta = $pasta1 ]
then
	zenity --warning --title=" " --text="Nenhum diretório foi criado. Por motivo de segurança dos dados o progama será encerrado!" --width=300 --height=250
	exit 0
else
        mkdir /media/$user/"$pasta"
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Criou a pasta: $pasta ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOG
        mount -t auto /dev/$dispositivo_x_expecifico_montado /media/$user/"$pasta"
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Montou o dispositivo $dispositivo_x_expecifico_montado ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOG
        echo "UUID=$uuid /media/$user/"$dispositivo_x_expecifico_montado"  rw,noauto,user,sync 0 0" >> /etc/fstab
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Adicionou informações do dispositovo: $dispositivo_x_expecifico_montado no fstab ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOG
        INFO=$(zenity --info --title=" " \
--text="A partição \"$dispositivo_x_expecifico_montado\" foi montada na sua pasta \"$pasta\" e as configurações para montagem foram salvadas em \"/etc/fstab/\" a montagem irá persistir!" \
--width="300" --height="150")
	/home/$user/util_disk/./teste.sh # botão voltar
fi

else
	exit 0

 fi
fi
