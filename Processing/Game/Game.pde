Game g1;
Hand userHand, p1Hand, p2Hand, p3Hand; // 4 players total

void setup() {
  size(600,600);
  background(100);
  g1 = new Game();
}

class Game {
  
  Hand userHand, p1Hand, p2Hand, p3Hand; // 4 players total
  boolean playing = false;
  int ctr = 1;
  
  String call() {
    String callStr = "";
    if ( ctr == 1 )
      callStr = "ACE";
    else if ( ctr == 11 ) 
      callStr = "JACK";
    else if ( ctr == 12 ) 
      callStr = "QUEEN";
    else if ( ctr == 13 ) {
      callStr = "KING";
      ctr = 0;
    }
    else 
      callStr += i;
    ctr++;
    return callStr;
    }
  }
  
  void startgame() {
    on = true;
    Deck d1 = new Deck();
    d1.deal();
    p1Hand = d1.getp1();
    p2Hand = d1.getp2();
    p3Hand = d1.getp3();
    userHand = d1.getp4();
  }
    
  
  void play() {
    startgame();
    if ( userHand.isEmpty() || ( p1Hand.isEmpty() && p2Hand.isEmpty() && p3Hand.isEmpty() ))
      playing = false;
    //while on = true
}

