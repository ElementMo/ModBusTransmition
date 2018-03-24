byte hex[8];
byte hexResult[9];
short result;
short test = 1333;

void setup() {
  Serial.begin(115200, SERIAL_8E1);

  hex[0] = 0x01;
  hex[1] = 0x04;
  hex[2] = 0x00;
  hex[3] = 0x01;
  hex[4] = 0x00;
  hex[5] = 0x02;
  hex[6] = 0x20;
  hex[7] = 0x0B;
}
void loop() {
  Serial.write(hex, 8);;
  delay(10);
}
void serialEvent() {
  if (Serial.available() > 0) {
    Serial.readBytes(hexResult, 9);
    result = (short)(((hexResult[5] & 0x00FF) << 8 | (0x00FF & hexResult[6])));
    //Serial.print('*');
    Serial.print(result);
    //Serial.print('*');
    Serial.print('\n');
  }
}
