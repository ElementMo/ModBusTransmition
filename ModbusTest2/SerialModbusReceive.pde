import processing.serial.*;
//import java.io.DataInputStream;

Serial myPort;
byte[] hex = new byte[8];
byte[] hexResult = new byte[9];
short result;

void setup() {
  size(1000, 1000);
  rectMode(CENTER);
  myPort = new Serial(this, "COM8", 115200, 'E', 8, 1.0);
  hex[0] = 0x01;
  hex[1] = 0x04;
  hex[2] = 0x00;
  hex[3] = 0x01;
  hex[4] = 0x00;
  hex[5] = 0x02;
  hex[6] = 0x20;
  hex[7] = 0x0B;
}
void draw() {
  translate(width/2, height/2);
  background(0);
  rotate(map(result, 0, 32767, 0, 8*TWO_PI));
  rect(0, 0, 1000, 30);
  myPort.buffer(9);
  delay(5);
  myPort.write(hex);
}

void serialEvent(Serial p) {
  hexResult = p.readBytes();
  result = (short)(((hexResult[5] & 0x00FF) << 8 |(0x00FF & hexResult[6])));
  println(result);
}
