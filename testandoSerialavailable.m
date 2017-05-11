% 10 de Março de 2017
% Esse código tem o objetivo de investigar se a função Serial.available() do arduino 
% retorna um numero maior que zero apenas com matlab abrindo a comunicação com o arduino
% usando a função fopen() ou se ela só retorna um número maior que um se de
% fato algum dado for enviado ao arduino

fclose(porta_serial);
porta_serial = serial ('COM5', 'BaudRate',9600,'DataBits',8, 'TimeOut', 10 );

%conecta o objeto porta_serial a porta física
fopen(porta_serial);


%Pausa de 2 segundos para que dê tempo que a serial do arduino inicialize.
%Esse tempo de 2 segundos é arbitrário e uma solução melhor deve ser
%procurada;
pause(2);

%desconecta o objeto porta_serial da porta serial COM3
fclose(porta_serial);


%CHEGOU-SE A CONCLUSÃO QUE SÓ ABRINDO A COMUNICAÇÃO COM FOPEN A FUNÇÃO Serial.available()
%RETORNA 0, É NECESSARIO ENVIAR ALGUM DADO AO ARDUINO PARA ELA RETORNA UM
%NÚMERO MAIOR QUE 0;