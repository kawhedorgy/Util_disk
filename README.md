Util_disk

Projeto voltado para a cadeira de Programação em Redes com linguagem "ShellScript"


Utilitário de Disco



Escreva um script usando o interpretador bourne-shell que tenha como centro o comando nmap, ele deverá atender ao seguintes requisitos:



   Interagir com o usuário para manipular discos com as seguintes funções:



          i.   Listar discos físicos;

          ii.   Ter opção de listar partições por disco físico exibido no item i;

          iii.   Ter opção de montar e desmontar partições;

          iv.   Opção de persistir as configurações de montagem no arquivo fstab;



   Fazer tratamento de erros para entradas inválidas

   Caso não seja passado nenhum endereço o script deve mostrar um resumo pro usuário de discos e seus respectivas partições e usos;



Requisitos técnicos:



   Utilizem grep para filtragem;

   Utilizem cut para retirar parte a parte as informações das linhas de retorno.

   Utilizem for in para rolar sobre as linhas de retorno do comando;

   Utilize funções para cada uma das atividades e biblioteca para organização do código;

   Efetuar LOG das ações em arquivo em /var/log.

   Use Zenity para interface gráfica;
