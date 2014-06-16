Game g;

void setup() {
  size(1050, 700);
  g = new Game();
  g.startGame();
}

void draw() {
  background(#38B480);
  // currently being tested
  g.user.getMine().displayHand();
  g.user.getMine().keyPressed();
  text(g.user.getMine().getCurrent().getValue(), 100, 100);
  //g.play();
  /*
  if (keyPressed == true) {
    keyPressed();
  }
  */
}

void keyPressed() {
  Card currentCard = g.user.getMine().getCurrent();
  if (keyCode == LEFT) {
    g.user.getMine().setCurrent(currentCard.getPrev());
    //current = current.getPrev();
  } else if (keyCode == RIGHT) {
    g.user.getMine().setCurrent(currentCard.getNext());
    //current = current.getNext();
  } else if (keyCode == UP) {
    g.user.getMine().discard();
    g.user.getMine().setCurrent(currentCard.getNext());
    //current = current.getNext();
  }
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

  void startGame() {
    isPlaying = true;
    d1.deal();
    player1 = new Player(d1.getp1());
    player2 = new Player(d1.getp2());
    player3 = new Player(d1.getp3());
    user = new Player(d1.getp4());
    int start = (int) random(4);
    currentPlayer = start;
  }

  // hey emily~ i fixed this :D
  // delete the comments after you see the message
  Hand getPlayer() {
    if (currentPlayer == 0) 
      return user.getMine();
    else if (currentPlayer == 1)
      return player1.getMine();
    else if (currentPlayer == 2)   
      return player2.getMine();  
    else if (currentPlayer == 3)
      return player3.getMine();
    else
      return null;
  }

  //void sayBS() {

  //}

  void play() {
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
}

