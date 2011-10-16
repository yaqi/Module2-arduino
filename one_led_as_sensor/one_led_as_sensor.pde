#define LED_N_SIDE 6
#define LED_P_SIDE 2
#include <Firmata.h>
void setup()
{
  Firmata.setFirmwareVersion(0, 1);
  Firmata.begin(9600);

//  pinMode(LED_ANALOG_0,INPUT);
  Serial.begin(9600);
}

void loop()
{
  int sensorValue;
  unsigned int j;

  // Apply reverse voltage, charge up the pin and led capacitance
  pinMode(LED_N_SIDE,OUTPUT);
  pinMode(LED_P_SIDE,OUTPUT);
  digitalWrite(LED_N_SIDE,HIGH);
  digitalWrite(LED_P_SIDE,LOW);

  // Isolate the pin 2 end of the diode
  pinMode(LED_N_SIDE,INPUT);
  digitalWrite(LED_N_SIDE,LOW);  // turn off internal pull-up resistor
  sensorValue = analogRead(0);//read the sensor valu
  if(sensorValue>=1023) 
  {
  digitalWrite(LED_P_SIDE,HIGH);
  digitalWrite(LED_N_SIDE,LOW);
  pinMode(LED_P_SIDE,OUTPUT);
  pinMode(LED_N_SIDE,OUTPUT);
  //delayMicroseconds(10000);
  delay(1000);
  }
  else
  {
  digitalWrite(LED_P_SIDE,LOW);
  digitalWrite(LED_N_SIDE,LOW);
  pinMode(LED_P_SIDE,OUTPUT);
  pinMode(LED_N_SIDE,OUTPUT);
  delayMicroseconds(100);
  }
  // we could turn it off, but we know that is about to happen at the loop() start
}

