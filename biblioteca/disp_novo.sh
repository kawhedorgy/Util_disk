#######################
#CAPTURA DA DATA ATUAL#
#######################

###########################
data=`date +%d-%m-%Y.%T`  #
###########################

##########################
#CAPTURA DO USUÁRIO ATUAL#
##########################

##############
user=`users` #
##############

################################
#CAPTURA DO ULTIMO DISPOSITIVO.#
################################
######################################################################
dispositivo=`fdisk -l | grep /media/$user | cut -d / -f 6 | tail -1` #
######################################################################

#CAPTURA DO SISTEMA DE ARQUIVOS.
############################################################################
dispositivo_novo=`df | grep "$dispositivo" | cut -c6-14 | cut -d " " -f 1` #
############################################################################


LIST_DISK=$(zenity --cancel-label="Sair do programa" --ok-label="Ok" --width=250 --height=300  --list --column "Opções"\
  "Desmontar"\
  "Montar"\
  "Copiar Arquivos"\
  "Voltar para o Inicio"\
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


	"Copiar Arquivos")

	/home/$user/util_disk/biblioteca/./copias.sh
;;
######################
#Quatta parte do Cód.#
######################

	"Voltar para o Inicio")

	/home/$user/util_disk/./teste.sh
;;
#####################
#Quinta parte do Cód.#
#####################

	*)
	exit 0
;;
esac



tar
