
##########################
#CAPTURA DO USUÁRIO ATUAL#
user=`users` #############
##########################
##########################
LOG=/var/log/arquivo.log #
##########################





	LIST_DISK=$(zenity --cancel-label="Fechar programa" --width=300 --height=300 --list --column "Opções" --title="Lista dos tipos de discos" \
 "Listar Dispositivos"\
 "Visualizar Logs do Sistema"\
 "Selecionar Dispositivo (montar-desmontar)"\
 "Dispositivo Removivel"\
 "Forçar Montagem"\
 "Sair");


  case "${LIST_DISK}" in

########################
#Primeira parte do Cód.#
########################

     "Listar Dispositivos")
	disco=`fdisk -l | grep -i '^/dev/sda' | cut -c6-9 | zenity --cancel-label="Voltar" --list --title="Informações do Dispositivo Físico" \
--text="Lista dos dispositvos físicos" --column "Dispositivo Físico" --width=300 --height=270`
     		exit 0	
if [ $? = 0 ] ;
then

	disk1=`fdisk -l | grep /dev/$disco > /home/$user/util_disk/biblioteca/arquivos`
	disk2=`blkid | grep /dev/$disco >> /home/$user/util_disk/biblioteca/arquivos`
	arquivo=$(cat /home/$user/util_disk/biblioteca/arquivos)
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Acessrou informações do disco físico ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOG
	teste=$(zenity --list --text="Informações do sistema" --title=" " --cancel-label="Sair do programa" --ok-label="Voltar ao inicio "\
  --column "Dispositivo - Inicializar - Início - Fim -  Setores - Tamanho - Id - Tipo " --width=500 --height=200 \
 "$arquivo");
	exit 0
if [ $? = 0 ]
then
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Verificou informações do disco:$disco ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOG
       # zenity --info --title=" " --text="As informações do disco \"$disco\" foram finalizadas!"
        /home/$user/util_disk/./teste.sh
else
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Encerreou o programa ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOG
        exit 0 #botão de sair
fi
else
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Voltou para o inicio do progama ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOG
	/home/$user/util_disk/./teste.sh #botão de voltar
fi
;;

#######################
#Segunda parte do Cód.#
#######################

    "Visualizar Logs do Sistema")

	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Verificou logs do sistema ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOG
	/home/$user/util_disk/biblioteca/./log_opcoes.sh
;;

########################
#Terceira parte do Cód.#
########################

    "Selecionar Dispositivo (montar-desmontar)")

        echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Verificou logs do sistema ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOG
        /home/$user/util_disk/biblioteca/./disp_novo.sh
;;

######################
#Quarta parte do Cód.#
######################

	"Dispositivo Removivel")

novo_dispositivo=`df | grep -i "^/dev/" | cut -c6-8 | cut -d " " -f 1 | tail -1`
dispositivo_sda=`df | grep "^/dev/sda" | cut -c6-8 | cut -d " " -f 1 | tail -1`


if [ $novo_dispositivo = $dispositivo_sda ]

then
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Nenhum disitivo novo foi encotrado pelo sistema ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOG
	zenity --warning --text="Nenhum disitivo novo foi encotrado! Favor inserir dispositivo para ser listado."
	zenity --question --ok-label=voltar --cancel-label=sair --text="Deseja voltar ao inicio ou sair do progrma?"

if [ $? != 0 ]
then
        echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Voltou para o inicio do programa ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOG
	/home/$user/util_disk/./teste.sh # botão voltar

else
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Encerrou o programa ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOG
        exit 0

fi

else
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Disitivo novo foi encotrado pelo sistema ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOG
	NOVO_DISP=`df | cut -d / -f 6 | tail -1 | zenity --cancel-label=Voltar --title="Dispositivo Novo" \
--text="Nome do disposito" --list --column "Removível"`

if [ $? != 0 ]
then
	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Voltou para o inicio do programa ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOG
                                                                    ###############
	/home/$user/util_disk/./teste.sh # botão voltar#
                                                                    ###############
else
                                                                                   ###########################
	/home/$user/util_disk/biblioteca/./disp_novo.sh # botão ok, listar opções.#
                                                                                   ###########################

	fi
fi
;;
######################
#Quinta parte di Cód.#
######################

	"Forçar Montagem")

	echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Forçou a montagem do disco ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOG
	/home/$user/util_disk/biblioteca/./forçar_montagem_opcoes.sh
;;
#####################
#Sexta parte do cód.#
#####################



	*)
	 echo " Inicio de rotina [`date +%d-%m-%Y.%T`] === Encerrou o programa ===  Fim de rotina [`date +%d-%m-%Y.%T`] " >> $LOG
         exit 0
;;
esac















