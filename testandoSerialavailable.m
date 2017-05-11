% 10 de Mar�o de 2017
% Esse c�digo tem o objetivo de investigar se a fun��o Serial.available() do arduino 
% retorna um numero maior que zero apenas com matlab abrindo a comunica��o com o arduino
% usando a fun��o fopen() ou se ela s� retorna um n�mero maior que um se de
% fato algum dado for enviado ao arduino

fclose(porta_serial);
porta_serial = serial ('COM5', 'BaudRate',9600,'DataBits',8, 'TimeOut', 10 );

%conecta o objeto porta_serial a porta f�sica
fopen(porta_serial);


%Pausa de 2 segundos para que d� tempo que a serial do arduino inicialize.
%Esse tempo de 2 segundos � arbitr�rio e uma solu��o melhor deve ser
%procurada;
pause(2);

%desconecta o objeto porta_serial da porta serial COM3
fclose(porta_serial);


%CHEGOU-SE A CONCLUS�O QUE S� ABRINDO A COMUNICA��O COM FOPEN A FUN��O Serial.available()
%RETORNA 0, � NECESSARIO ENVIAR ALGUM DADO AO ARDUINO PARA ELA RETORNA UM
%N�MERO MAIOR QUE 0;