%Autor: Gabriel Daltro Duarte
%Data: 22 de maio de 2017
%Local: Jo�o Pessoa, Para�ba - Brasil

%Limpa a tela
clc;

%Cria um objeto do tipo serial port associado a porta serial 'COM5' com
%taxa de tramiss�o (BaudRate) de 9600 bits/segundo
porta_serial = serial ('COM5', 'BaudRate', 9600);

%Conecta o objeto do tipo serial port ao Arduino 
fopen(porta_serial);

%L� qual LED dever� ser aceso
n = input ('Escolha qual LED deseja acender (1(amarelo),2(verde) ou 3(vermelho)): ');

%Aguarda que o Arduino envie o string 'SIM' indicando que sua porta serial
%foi incicializada
while ( (strcmp (fscanf(porta_serial,'%s'),'SIM')) == 0 ) 
   %disp ('Esperando SIM');
end

%Envia o n�mero que representa qual LED dever� ser aceso. 
fwrite(porta_serial,[n],'uint8'); 

%Aguarda que o Arduino anceda o LED e envie o string de confirma��o
while ( porta_serial.BytesAvailable == 0 )
    %disp ('ESPERANDO DADOS...');
end

%L� o string de confirma��o enviado pelo Arduino
stringRecebido = fscanf(porta_serial,'%s'); 

%Exibe na janela de comandos o string de confima��o enviado pelo arduino
disp (stringRecebido); 

%Fecha a comunica��o serial com o Arduino permintindo que outros
%dispositivos possam se comunicar com ele. 
fclose(porta_serial);