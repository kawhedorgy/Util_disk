#CAPTURA DA DATA ATUAL
###########################
data=`date +%d-%m-%Y.%T`  #
###########################

#CAPTURA DO USUÁRIO ATUAL
##############
user=`users` #
##############

#CAPTURA DO ULTIMO DISPOSITIVO.
######################################################################
dispositivo=`fdisk -l | grep /media/$user | cut -d / -f 6 | tail -1` #
######################################################################

#CAPTURA DO SISTEMA DE ARQUIVOS.
##################################################################################
dispositivo_novo=`fdisk -l | grep "$dispositivo" | cut -c6-14 | cut -d " " -f 1` #
##################################################################################


LIST_DISK=$(zenity --cancel-label="Sair do programa" --width=250 --height=300  --list --column "Opções"\
  "Desmontar"\
  "Montar"\
  "Copiar Arquivos"\
  "Voltar para o Inicio"\
  "Forçar a Montagem"\
  "Sair")

  case "${LIST_DISK}" in
########################
#Primeira parte do Cód.#
########################
	"Desmontar")

	/home/$user/util_disk/biblioteca/./voltar_a_desmontar_opcoes.sh

;;
#######################
#Segunda parte do Cód.#
#######################

	"Montar")

	/home/$user/util_disk/biblioteca/./voltar_a_montar_opcoes.sh


;;
#########################
#Terceira partes do Cód.#
#########################

#	"Formatar")

	#COMANDOS QUE SERÃO EXECUTADOS.
#if [ $alguma_coisa = $alguma_coisa ]
#then
#	zenity --question
#	mkdir -p /media/$user/backup."$dispositivo"."$data"
#       cp -rf /media/$user/"$dispositivo"/*  /media/$user/backup."$dispositivo"."$data"
#else
	#APENAS FORMATE O DISPOSITIVO!!!!
#	formatar o $distpositivo_novo /home/$user/$nome_da_pasta #está errado!
#fi

#;;
######################
#Quarta parte do Cód.#
######################

	"Copiar Arquivos")
	/home/$user/util_disk/biblioteca/./copias.sh
;;
######################
#Quinta parte do Cód.#
######################

	"Voltar para o Inicio")

	/$user/util-disk/./teste.sh
;;
#####################
#Sexta parte do Cód.#
#####################

       "Forçar a Montagem")

;;
######################
#Sétima parte do Cód.#
######################

	*)
	exit 0
;;
esac



