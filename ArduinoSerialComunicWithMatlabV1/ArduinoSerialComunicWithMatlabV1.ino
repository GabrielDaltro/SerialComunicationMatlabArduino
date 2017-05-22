                
/* Autor: Gabriel Daltro Duarte
 * Data: 22 de maio de 2017
 Local: João Pessoa, Paraíba - Basil*/


int ledA = 8; // Pino do LED amarelo conectado ao pino 8 do arduino
int ledVERD = 9; // Pino do LED verde conectado ao pino 9 do arduino
int ledVERM = 10; // Pino do LED verde conectado ao pino 10 do arduino

byte dadosByte = 0; // Variável que armazena os dados recebidos do matlab             

void setup()
{ 
   // define os pinos do arduino conectados aos leds como saída
    pinMode(ledA, OUTPUT);
    pinMode(ledVERD, OUTPUT);
    pinMode(ledVERM, OUTPUT);
    //pinMode(13, OUTPUT);

    // Escreve 0 nos pinos conectados aos LED para garantir que ele iniciem apagados
    digitalWrite(ledA, LOW);   
    digitalWrite(ledVERD, LOW);    
    digitalWrite(ledVERM, LOW);   
    //digitalWrite (13,LOW);

    //Configura a porta serial para a taxa de transmissão de 9600 bits/s
    Serial.begin (9600);

   // Envia o string "SIM" para o matlab para indicar que a porta serial já foi incializada
   //Ao reeber "SIM", o matlab sabe que já pode enviar e receber dados do arduino
    Serial.println ("SIM");             
}

void loop()
{
     
   if (Serial.available() > 0) // Condição válida quando o arduino recebe algum byte
   {
      dadosByte = Serial.read(); // Lê os dados recebidos 
      switch (dadosByte)  // Switch que define qual LED irá acender
        {                 // Ao acender algum LED, o arduino envia ao matlab um string confirmando que o LED selecionado foi aceso
          case 1:
            digitalWrite(ledA, HIGH);   
            digitalWrite(ledVERD, LOW);    
            digitalWrite(ledVERM, LOW);  
            Serial.println ("LED_AMARELO_ACESO"); 
            break;
          case 2:
            digitalWrite(ledA, LOW);   
            digitalWrite(ledVERD, HIGH);    
            digitalWrite(ledVERM, LOW);   
            Serial.println ("LED_VERDE_ACESO"); 
            break;
          case 3:
            digitalWrite(ledA, LOW);   
            digitalWrite(ledVERD, LOW);    
            digitalWrite(ledVERM, HIGH);  
            Serial.println ("LED_VERMELHO_ACESO");  
            break;  
          default: 
             Serial.println ("ERRO!");  
          break;
      }
   }          
}
