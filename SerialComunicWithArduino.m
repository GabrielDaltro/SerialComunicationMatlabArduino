%Autor: Gabriel Daltro Duarte
%Data: 12 de maio de 2017
%Local: João Pessoa

%Descrição:
%Este script do matlab envia os números 1(amarelo), 2(verde) ou 3(vermelho)
%para o arduino indicando qual led deverá ser aceso, após isso aguarda a
%confirmação do arduino (um string) indicando que o LED desejado foi aceso;


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


%O parâmetro 'COM5' é o nome dado pelo windows a porta serial do arduino,
%quando o arduino é conectado ao computador. Esse nome varia de computador
%para computador

%Se as outras configurações como o a quantidade de bits de dado ou paridade
%não são definidos durante a declaração da porta, essas configurações assumem
%uma configuração padrão igual a configuração da porta serial do arduino,
%portando não é necessário definir as outras configurações, pois fazendo
%isso, já estamos configurando o objeto porta serial do matlab com as
%mesmas configurações da porta serial do arduino;

%conecta o objeto porta_serial a porta física 'COM5'
%A partir da execução dessa linha a porta serial do arduino está reservada
%a comunicar-se apenas com o matlab. Outras aplicações, como por exemplo
%o Monitor Serial da IDE do Arduino não será capaz de se comunicar com o
%arduino até que o matlab encerre a comuncação usando a função fclose;
fopen(porta_serial);

%Esse laço alguarda que o arduino envie o string 'SIM' indicando que a
%porta serial dele já foi inicializada e ele já é capaz de enviar e receber
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
%O argumento 'uint8' significa que os elementos do vetor são números inteiros sme sinal de 8 bits  
fwrite(porta_serial,[n],'uint8'); 

%Espra a resposta do arduino
while ( porta_serial.BytesAvailable == 0 )
    %disp ('ESPERANDO DADOS...');
end

%Lê a resposta do arduino
%dadosRecebidos = fread (porta_serial,1, 'uint8'); %LÊ UM INTEIRO DE 8 BITS RECEBIDO ATRAVÉS DA SERIAL
stringRecebido = fscanf(porta_serial,'%s'); %LÊ UM STRING RECEBIDO ATRAVÉS DA SERIAL

%Exibe a resposta do arduino
%disp (dadosRecebidos); %EXIBE UM INTEIRO DE 8 BITS DA SERIAL
disp (stringRecebido); %EXIBE O STRING RECEBIDO ATRAVÉS DA SERIAL

%desconecta o objeto porta_serial da porta serial COM3
fclose(porta_serial);
