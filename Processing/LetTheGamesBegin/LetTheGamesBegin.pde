Game g;

void setup() {
  size(1050, 700);
  g = new Game();
  g.startGame();
}

void draw() {
  background(#38B480);
  displayText();
  g.user.getMine().displayHand();
  //g.play();
}

void displayText() {
  textSize(16);
  textAlign(RIGHT);
  if (g.getPlayer().equals(g.player1)) {
    fill(#000EF7);
    text("Player 1", 100, 275);
    fill(255);
  } else {
    text("Player 1", 100, 275);
  }
  if (g.getPlayer().equals(g.user)) {
    fill(#000EF7);
    text("User", 50, 690);
    fill(255);
  } else {
    text("User", 50, 690);
  }
  textAlign(CENTER);
  if (g.getPlayer().equals(g.player2)) {
    fill(#000EF7);
    text("Player 2", 500, 50);
    fill(255);
    text("Discard pile", 500, 400);
  } else {
    text("Player 2", 500, 50);
    text("Discard pile", 500, 400);
  }
  textAlign(LEFT);
  if (g.getPlayer().equals(g.player3)) {
    fill(#000EF7);
    text("Player 3", 950, 275);
    fill(255);
  } else {
    text("Player 3", 959, 275);
  }
}

void keyPressed() {
  Hand userHand = g.user.getMine();
  Card currentCard = userHand.getCurrent();
  if (keyCode == LEFT) {
    userHand.setCurrent(currentCard.getPrev());
  } else if (keyCode == RIGHT) {
    userHand.setCurrent(currentCard.getNext());
  } else if (keyCode == UP) {
    userHand.discard();
    userHand.setCurrent(currentCard.getNext());
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
    ctr++;
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
    return callStr;
  }

  void startGame() {
    isPlaying = true;
    d1.deal();
    player1 = new Player(d1.getp1());
    player2 = new Player(d1.getp2());
    player3 = new Player(d1.getp3());
    user = new Player(d1.getp4());
    //user.setMine(g.user.getMine().mergeSort(d1.getp4()));
    int start = (int) random(4);
    currentPlayer = start;
  }

  Hand getPlayerHand() {
    return getPlayer().getMine();
  }

  Player getPlayer() {
    if (currentPlayer == 0) 
      return user;
    else if (currentPlayer == 1)
      return player1;
    else if (currentPlayer == 2)   
      return player2;  
    else if (currentPlayer == 3)
      return player3;
    else
      return null;
  }


  Player sayBS(Player play1, Player play2, Player play3) {
    int max = play1.calcBS();
    Player caller = play1;
    if ( play2.calcBS() > max ) {
      max = play2.calcBS();
      caller = play2;
    }
    if ( play3.calcBS() > max ) {
      max = play3.calcBS();
      caller = play3;
    }
    if ( max < 30 )
      caller = null;
    return caller;
  }
    

  void play() {
    if (user.getMine().isEmpty() 
      || player1.getMine().isEmpty() 
      || player2.getMine().isEmpty() 
      || player3.getMine().isEmpty() ) 
      isPlaying = false; 
    while ( isPlaying == true ) {
      Discards d = new Discards();
      call();
      if (currentPlayer == 3)
        currentPlayer = 0;
      //if (currentPlayer = 0) 
      //insert code for player clicking card & placing it down
      if (currentPlayer == 1) {
        Card down = player1.compPlay(d, ctr);
        Player said = sayBS(player1, player2, player3);
        if ( said != player1 && said != null ) {
          if ( down.getValue() == ctr )
            said.takeDis(d);
          else 
            player1.takeDis(d); 
        }
      }
      if (currentPlayer == 2) {
        Card down = player2.compPlay(d, ctr);
        Player said = sayBS(player1, player2, player3);
        if ( said != player2 && said != null ) {
          if ( down.getValue() == ctr )
            said.takeDis(d);
          else 
            player2.takeDis(d); 
        }
      }
      if (currentPlayer == 3) {
        Card down = player3.compPlay(d, ctr);
        Player said = sayBS(player1, player2, player3);
        if ( said != player3 && said != null ) {
          if ( down.getValue() == ctr )
            said.takeDis(d);
          else 
            player3.takeDis(d); 
        }
      }
    }
  }

}

