user=`users`

        disco=$( fdisk -l | grep -i 'Disco /dev/sda' | cut -c1-15 | zenity --list --cancel-label="Voltar" --title="Informações do Dispositivo Físico" \
--text="Lista dos dispositvos físicos" --column "Dispositivo Físico" --width=300 --height=270)

if [ $? != 0 ]
then
echo $?
       /home/$user/util_disk/./teste.sh
       exit 0
else
        disk1=`fdisk -l | grep 'Disco /dev/sda' > /home/$user/util_disk/biblioteca/arquivos1`
        disk2=`blkid | grep 'Disco /dev/sda' >> /home/$user/util_disk/biblioteca/arquivos1`
        arquivo=$(cat /home/$user/util_disk/biblioteca/arquivos1)

        teste=$(zenity --list --text="Informações do sistema" --title=" " --cancel-label="Sair do programa" --ok-label="Voltar"\
  --column "Dispositivo"  --width=500 --height=200 \
 "$arquivo");

if [ $? = 0 ]
then
echo $?
       # zenity --info --title=" " --text="As informações do disco \"$disco\" foram finalizadas!"
        /home/$user/util-disk/./teste.sh
	exit 0
         #botão de sair4


  
 fi
fi

