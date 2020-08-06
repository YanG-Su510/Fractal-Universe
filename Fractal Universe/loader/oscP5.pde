import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

void send(int signal) {
  OscMessage myMessage = new OscMessage("loader");
  myMessage.add(signal);
  oscP5.send(myMessage, myRemoteLocation); 
}
