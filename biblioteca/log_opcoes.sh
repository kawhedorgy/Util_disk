

##############
user=`users` #
##############
#################################################
#Abre o arquivo dos logs no /var/log/arquivo.log#
#################################################
#################################
log=$(cat /var/log/arquivo.log) #
#################################
####################################################################################################################################################
lista_de_logs=$(zenity --list --cancel-label="Sair do programa" --ok-label="Voltar" --text=" " --title=" " --width=600 --height=300 --column "Ocorrência(s)" "$log") ; #
####################################################################################################################################################

if [ $? = 0 ]
then

	zenity --info --text="A listagem dos logs do programa foram finalizadas!" --title=" " --width=400 --height=200
	/home/$user/util_disk/./teste.sh #botão de voltar

else
	exit 0 #botão de sair
fi
