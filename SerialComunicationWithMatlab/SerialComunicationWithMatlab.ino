int ledPin = 13;                 
int ledA = 8; 
int ledV1 = 9; 
int ledV2 = 10;  
char dadosChar = 'b';  
byte dadosByte = 0;             

String SIM = "SIM";
String ACK = "NULL";

void setup()
{

    
  
    pinMode(ledPin, OUTPUT);      // sets the digital pin as output
    pinMode(ledA, OUTPUT);
    pinMode(ledV1, OUTPUT);
    pinMode(ledV2, OUTPUT);
    
    digitalWrite(ledPin, LOW);    // sets the LED off
    digitalWrite(ledA, LOW);    // sets the LED off
    digitalWrite(ledV1, LOW);    // sets the LED off
    digitalWrite(ledV2, LOW);    // sets the LED off
    
    Serial.begin (9600);
  /* while (!Serial){
      digitalWrite (ledA,HIGH);
    } 
  */    
              
}

void loop()
{

   while (ACK != "ACK") // NÃO DÁ CERTO - ESTOURA O BUFFER - TENTAR USAR TIME OUT
    {
      Serial.print ("SIM");
      if (Serial.available() > 0)
      {
        ACK = Serial.readString();  
      }
    }
  
   if (Serial.available() > 0)
   {
      digitalWrite (ledA, HIGH); 
      digitalWrite(ledV1, HIGH);
      delay(500);
      digitalWrite(ledV1, LOW);
      dadosByte = Serial.read();
      if (dadosByte == 1)
      {
        digitalWrite(ledV2, HIGH);
        //delay(1);
        Serial.write (10);
      }
      else
      {
         digitalWrite(ledV2, LOW);
         //delay(1000);
         Serial.write (20);
      }  
   }          
}
