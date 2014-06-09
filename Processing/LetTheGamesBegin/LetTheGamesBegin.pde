Game g;

void setup() {
  size(600, 600);
  g = new Game();
}

void draw() {
  background(100);
  g.play();
}

class Game {
  Deck d1;
  Discards discardPile;
  Hand user, player1, player2, player3;
  Hand currentPlayer;
  boolean isPlaying;
  int ctr;

  Game() {
    d1 = new Deck();
    discardPile = new Discards();
    user = player1 = player2 = player3 = new Hand();
    //startingPlayer();
    isPlaying = false;
  }
  
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
        callStr = "" + ctr;
      ctr++;
      return callStr;
    }

    void startgame() {
      isPlaying = true;
      d1.deal();
      player1 = d1.getp1();
      player2 = d1.getp2();
      player3 = d1.getp3();
      user = d1.getp4();
    }

    void play() {
      startgame();
      if (user.isEmpty() || player1.isEmpty() || player2.isEmpty() || player3.isEmpty() ) 
        isPlaying = false; 
      while ( isPlaying = true ) {
        call();
      
    }
  }
}

