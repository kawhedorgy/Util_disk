user=`users`

        disco=$(fdisk -l | df -h | grep -i '/dev/sda' | cut -c6-9 | zenity --list --cancel-label="Voltar" --title="Informações do Dispositivo Físico" \
--text="Lista dos dispositvos físicos" --column "Dispositivo Físico" --width=300 --height=270)

if [ $? != 0 ]
then
echo $?
       /home/$user/util_disk/./teste.sh

else
        disk1=`fdisk -l | df -h | grep /dev/$disco > /home/$user/util_disk/biblioteca/arquivos`
        disk2=`blkid | grep /dev/$disco >> /home/$user/util_disk/biblioteca/arquivos`
        arquivo=$(cat /home/$user/util_disk/biblioteca/arquivos)

        teste=$(zenity --list --text="Informações do sistema" --title=" " --cancel-label="Sair do programa" --ok-label="Voltar"\
  --column "Dispositivo"  --width=500 --height=200 \
 "$arquivo");

if [ $? = 0 ]
then
        zenity --info --title=" " --text="As informações do disco \"$disco\" foram finalizadas!"
        /home/$user/util-disk/./teste.sh
else
        exit 0 #botão de sair
 fi
fi

