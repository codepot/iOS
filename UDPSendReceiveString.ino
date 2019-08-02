/*
  UDPSendReceiveString.pde:
 This sketch receives UDP message strings, prints them to the serial port
 and sends a string back to the sender
*/


#include <SPI.h>         // needed for Arduino versions later than 0018
#include <Ethernet.h>
#include <EthernetUdp.h>         // UDP library from: bjoern@cs.stanford.edu 12/30/2008


// Enter a MAC address and IP address for your controller below.
byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };

//IPAddress ip(172, 17, 216, 196);
//IPAddress ip(10, 220, 0, 19);
IPAddress ip(10, 240, 0, 19);

unsigned int localPort = 8888;      // local port to listen on

// buffers for receiving and sending data
char packetBuffer[UDP_TX_PACKET_MAX_SIZE]; //buffer to hold incoming packet,
char  ReplyBuffer[] = "acknowledged";       // a string to send back

// An EthernetUDP instance to let us send and receive packets over UDP
EthernetUDP Udp;

int greenLED = 9;
int blueLED = 8;

int messageLength=4;

String input, inputOn, inputOff, inputBlueOn, inputBlueOff;

void setup() 
{
  pinMode(greenLED, OUTPUT);
  pinMode(blueLED, OUTPUT);
  
  inputOn = String("gron");
  inputOff = String("goff");
  inputBlueOn = String("blOn");
  inputBlueOff = String("bOff");
  
  // start the Ethernet and UDP:
  Ethernet.begin(mac,ip);
  Udp.begin(localPort);

  //Serial.begin(9600);
  //Serial.print("startup");
}

void loop() 
{

  // if there's data available, read a packet
  int packetSize = Udp.parsePacket();

  if(packetSize)
  {
    /*
    //Serial.print("Received packet of size ");
    //Serial.println(packetSize);
    //Serial.print("From ");
    IPAddress remote = Udp.remoteIP();
    for (int i =0; i < 4; i++)
    {
      Serial.print(remote[i], DEC);
      if (i < 3)
      {
        Serial.print(".");
      }
    }
    Serial.print(", port ");
    Serial.println(Udp.remotePort());
*/
    // read the packet into packetBufffer
    
    Udp.read(packetBuffer,UDP_TX_PACKET_MAX_SIZE);
    //Serial.println("Contents:");
    //Serial.println(packetBuffer);

    input = String(packetBuffer);

    if(input.substring(0,4) == inputOn)
    {
      digitalWrite(greenLED, HIGH);
      //Serial.println("inputOn"); 
    }
    else if (input.substring(0,4) == inputBlueOn)
    {
      digitalWrite(blueLED, HIGH);
      //Serial.println("inputBlueOn");
    }
    else
    {
     //Serial.println("not inputOn"); 
    }
    
    if (input.substring(0,4) == inputOff)
    {
      digitalWrite(greenLED, LOW);
    }
    else if (input.substring(0,4) == inputBlueOff)
    {
      digitalWrite(blueLED, LOW);
    }
    
    // send a reply, to the IP address and port that sent us the packet we received
    Udp.beginPacket(Udp.remoteIP(), Udp.remotePort());
    Udp.write(ReplyBuffer);
    Udp.endPacket();
  }
  
  
 // delay(10);

 // digitalWrite(blueLED, HIGH);
  
  //delay(100);
  
  //d/igitalWrite(blueLED, LOW);
  ///delay(100);
}


/*
  Processing sketch to run with this example
 =====================================================
 
 // Processing UDP example to send and receive string data from Arduino 
 // press any key to send the "Hello Arduino" message
 
 
 import hypermedia.net.*;
 
 UDP udp;  // define the UDP object
 
 
 void setup() {
 udp = new UDP( this, 6000 );  // create a new datagram connection on port 6000
 //udp.log( true ); 		// <-- printout the connection activity
 udp.listen( true );           // and wait for incoming message  
 }
 
 void draw()
 {
 }
 
 void keyPressed() {
 String ip       = "192.168.1.177";	// the remote IP address
 int port        = 8888;		// the destination port
 
 udp.send("Hello World", ip, port );   // the message to send
 
 }
 
 void receive( byte[] data ) { 			// <-- default handler
 //void receive( byte[] data, String ip, int port ) {	// <-- extended handler
 
 for(int i=0; i < data.length; i++) 
 print(char(data[i]));  
 println();   
 }
 */


