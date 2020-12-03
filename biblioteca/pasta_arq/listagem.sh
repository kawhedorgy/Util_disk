disco=`blkid | grep -i /dev | cut -c6-14 | cut -d " " -f 1`
/home/trojanhorse/script_testeviral/biblioteca/comando_test_opções.sh $disco
