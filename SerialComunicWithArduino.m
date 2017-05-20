%Autor: Gabriel Daltro Duarte
%Data: 12 de maio de 2017
%Local: Jo�o Pessoa

%Descri��o:
%Este script do matlab envia os n�meros 1(amarelo), 2(verde) ou 3(vermelho)
%para o arduino indicando qual led dever� ser aceso, ap�s isso aguarda a
%confirma��o do arduino (um string) indicando que o LED desejado foi aceso;


%Dados da porta serial do arduino:

%BaudRate: 9600;
%Bits de Dados: 8;
%Paridade: Nenhuma;
%1 bit e parada

clc;
%fclose(porta_serial);

%Declarando um objeto porta serial com BaudRate de 9600 bits/s
porta_serial = serial ('COM5', 'BaudRate', 9600, 'Timeout',2);


n = input ('Escolha qual LED deseja acender (1(amarelo),2(verde) ou 3(vermelho)): ');


%O par�metro 'COM5' � o nome dado pelo windows a porta serial do arduino,
%quando o arduino � conectado ao computador. Esse nome varia de computador
%para computador

%Se as outras configura��es como o a quantidade de bits de dado ou paridade
%n�o s�o definidos durante a declara��o da porta, essas configura��es assumem
%uma configura��o padr�o igual a configura��o da porta serial do arduino,
%portando n�o � necess�rio definir as outras configura��es, pois fazendo
%isso, j� estamos configurando o objeto porta serial do matlab com as
%mesmas configura��es da porta serial do arduino;

%conecta o objeto porta_serial a porta f�sica 'COM5'
%A partir da execu��o dessa linha a porta serial do arduino est� reservada
%a comunicar-se apenas com o matlab. Outras aplica��es, como por exemplo
%o Monitor Serial da IDE do Arduino n�o ser� capaz de se comunicar com o
%arduino at� que o matlab encerre a comunca��o usando a fun��o fclose;
fopen(porta_serial);

%Esse la�o alguarda que o arduino envie o string 'SIM' indicando que a
%porta serial dele j� foi inicializada e ele j� � capaz de enviar e receber
%dados
a = (1 == 1);
while (a)
    if (porta_serial.BytesAvailable ~= 0)
       disp ('tem byte'); 
       if ( strcmp (fscanf(porta_serial,'%s'),'SIM'))
         a = ~a;
       end
    end
end
%while ( ~(strcmp (fscanf(porta_serial,'%s'),'SIM')) ) 
 %   disp ('Esperando SIM');
%end

%escreve o caracter 'c' na porta serial  
%fprintf(porta_serial, '%c','a'); 

%escreve na porta_serial o vetor passado como segundo argumento.
%O argumento 'uint8' significa que os elementos do vetor s�o n�meros inteiros sme sinal de 8 bits  
fwrite(porta_serial,[n],'uint8'); 

%Espra a resposta do arduino
while ( porta_serial.BytesAvailable == 0 )
    %disp ('ESPERANDO DADOS...');
end

%L� a resposta do arduino
%dadosRecebidos = fread (porta_serial,1, 'uint8'); %L� UM INTEIRO DE 8 BITS RECEBIDO ATRAV�S DA SERIAL
stringRecebido = fscanf(porta_serial,'%s'); %L� UM STRING RECEBIDO ATRAV�S DA SERIAL

%Exibe a resposta do arduino
%disp (dadosRecebidos); %EXIBE UM INTEIRO DE 8 BITS DA SERIAL
disp (stringRecebido); %EXIBE O STRING RECEBIDO ATRAV�S DA SERIAL

%desconecta o objeto porta_serial da porta serial COM3
fclose(porta_serial);
