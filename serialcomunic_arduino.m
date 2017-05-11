%Com do Arduino
%Características:
%BaudRate: 9600;
%Bits de Dados: 8;
%Paridade: Nenhuma;
%Controle de Fluxo: Nenhum

%Declarando a porta serial com BaudRate de 9600 bits/s
fclose(porta_serial);
porta_serial = serial ('COM5', 'BaudRate',9600,'DataBits',8, 'TimeOut', 10 );

%conecta o objeto porta_serial a porta física
fopen(porta_serial);


%Pausa de 2 segundos para que dê tempo que a serial do arduino inicialize.
%Esse tempo de 2 segundos é arbitrário e uma solução melhor deve ser
%procurada;
%pause(2);

while (fscanf(porta_serial,'%s')~= 'SIM') 
    disp ('Esperando SIM');
    clc;
end
fprintf (serial_porta,'%s','ACK');

    
    

%fprintf(porta_serial, '%c','a'); %escreve o caracter 'c' na porta serial
fwrite(porta_serial,[0],'uint8'); %escreve o número 1 na porta serial


%Espra a resposta do arduino
while ( porta_serial.BytesAvailable == 0 )
    disp ('No laço');
end

%Lê a resposta do arduino
dadosRecebidos = fread (porta_serial,1, 'uint8');

%Exibe a resposta do arduino
disp (dadosRecebidos);



%desconecta o objeto porta_serial da porta serial COM3
fclose(porta_serial);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% function[obj,flag] = setupSerial(comPort)
% % It accept as the entry value, the index of the serial port
% % Arduino is connected to, and as output values it returns the serial 
% % element obj and a flag value used to check if when the script is compiled
% % the serial element exists yet.
% flag = 1;
% % Initialize Serial object
% obj = serial(comPort);
% set(obj,'DataBits',8);
% set(obj,'StopBits',1);
% set(obj,'BaudRate',9600);
% set(obj,'Parity','none');
% fopen(obj);
% a = 'b';
% while (a~='a') 
%     a=fread(obj,1,'uchar');
% end
% if (a=='a')
%     disp('Serial read');
% end
% fprintf(obj,'%c','a');
% mbox = msgbox('Serial Communication setup'); uiwait(mbox);
% fscanf(obj,'%u');
% end
