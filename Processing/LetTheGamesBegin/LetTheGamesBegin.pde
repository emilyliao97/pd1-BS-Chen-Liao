Game g;

void setup() {
  size(600,600);
  g = new Game();
}

void draw() {
  background(255);
  fill(255,0,0);
  g.play();
}

class Game {
  Deck d1;
  Discards discardPile;
  Player user, player1, player2, player3;
  int currentPlayer;
  boolean isPlaying;
  int ctr;

  Game() {
    d1 = new Deck();
    discardPile = new Discards();
    // in the middle of changing & incorportating a player class
    Player user = player1 = player2 = player3 = new Player();
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
    } else 
      callStr = "" + ctr;
    ctr++;
    return callStr;
  }

  void startgame() {
    isPlaying = true;
    d1.deal();
    player1 = new Player(d1.getp1());
    player2 = new Player(d1.getp2());
    player3 = new Player(d1.getp3());
    user = new Player(d1.getp4());
    int start = (int) random(4);
    currentPlayer = start;
  }

  //why can't i do that? :( 
  /*
    Hand getPlayer() {
   if (currentPlayer == 0) 
   return user;
   if (currentPlayer == 1)
   return player1;
   if (currentPlayer == 2)   
   return player2;  
   if (currentPlayer == 3)
   return player3;
   }
   */

  //void sayBS() {

  //}

  void play() {
    startgame();
    if (user.getMine().isEmpty() 
      || player1.getMine().isEmpty() 
      || player2.getMine().isEmpty() 
      || player3.getMine().isEmpty() ) 
      isPlaying = false; 
    while ( isPlaying == true ) {
      call();
      if (currentPlayer == 3)
        currentPlayer = 0;
      //if (currentPlayer = 0) 
      //insert code for player clicking card & placing it down
    }
  }

  void displayUserHand() {   
    // displaying image in progress
/*
    for (int i=0; i<g.user.getMine().getSize(); i++) {
      image(g.user.getMine().getCurrent().getImage(), 50+75*i, 500);
    }
    */
  }
}

