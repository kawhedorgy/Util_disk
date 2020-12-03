##########################
#CAPTURA DO USUÁRIO ATUAL#
##########################
##############
user=`users` #
##############


LIST_DISK=$(zenity --list --cancel-label="Sair do programa" --width=250 --height=300  --column "Selecione a opção"\
 "Desmontar"\
 "Montar"\
 "Voltar para o Inicio"\
 "Sair") ;

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
######################
#Terceira parte do Cód.#
######################

	"Voltar para o Inicio")

	/home/$user/util_disk/./teste.sh
;;
#####################
#Quarta parte do Cód.#
####################

	*)
	exit 0
;;
esac



