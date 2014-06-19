Game g;

void setup() {
  size(1050, 700);
  g = new Game();
  g.startGame();
  g.play();
}

void draw() {
  background(#38B480);
  displayText();
  g.discardPile.displayDiscards();
  g.user.getMine().displayHand();
}

// very messy code
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
  if (g.currentPlayer != 0) {
    text("<Press ENTER to continue>", 500, 690);
  }
  if (g.getPlayer().equals(g.player2)) {
    fill(#000EF7);
    text("Player 2", 500, 50);
    fill(255);
  } else {
    text("Player 2", 500, 50);
  }
  text("Number of cards discarded: "+g.discardPile.getSize(), 500, 400);
  text("Current card: " + g.getCurrentCard(), 500, 425);
  fill(#8AE0C0);
  rect(450, 200, 106, 169);
  textAlign(LEFT);
  fill(255);
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
  if (g.currentPlayer == 0) {
    if (keyCode == LEFT) {
      userHand.setCurrent(currentCard.getPrev());
    } else if (keyCode == RIGHT) {
      userHand.setCurrent(currentCard.getNext());
    } else if (keyCode == UP) {
      g.discardPile.addCard(userHand.discard());
      userHand.setCurrent(currentCard.getNext());
      g.play();
    }
  } else {
    if (keyCode == ENTER) {
      g.play();
    }
  }
}

class Game {
  Deck d1;
  Discards discardPile;
  Player user, player1, player2, player3;
  int currentPlayer;
  boolean isPlaying;
  int ctr;
  String currentCard = "";

  Game() {
    d1 = new Deck();
    discardPile = new Discards();
    // in the middle of changing & incorportating a player class
    Player user = player1 = player2 = player3 = new Player();
    //startingPlayer();
    isPlaying = false;
  }

  void delay(int n) {
    try {
      Thread.sleep(n);
    }
    catch (InterruptedException e) {
      System.exit(0);
    }
  }

  void call() {
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
    currentCard = callStr;
  }

  String getCurrentCard() {
    return currentCard;
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
      || player3.getMine().isEmpty() ) { 
      isPlaying = false;
      noLoop(); // stops the draw method
    } else if (isPlaying == true) {
      call();
      //if (currentPlayer = 0) 
      //see code above with keys     
      if (currentPlayer == 1) {
        Card down = player1.compPlay(discardPile, ctr);
        discardPile.addCard(down);
        Player said = sayBS(player1, player2, player3);
        if ( said != player1 && said != null ) {
          if ( down.getValue() == ctr )
            said.takeDis(discardPile);
          else 
            player1.takeDis(discardPile);
        }
      }
      if (currentPlayer == 2) {
        Card down = player2.compPlay(discardPile, ctr);
        discardPile.addCard(down);
        Player said = sayBS(player1, player2, player3);
        if ( said != player2 && said != null ) {
          if ( down.getValue() == ctr )
            said.takeDis(discardPile);
          else 
            player2.takeDis(discardPile);
        }
      }
      if (currentPlayer == 3) {
        Card down = player3.compPlay(discardPile, ctr);
        discardPile.addCard(down);
        Player said = sayBS(player1, player2, player3);
        if ( said != player3 && said != null ) {
          if ( down.getValue() == ctr )
            said.takeDis(discardPile);
          else 
            player3.takeDis(discardPile);
        }
      }
      if (currentPlayer == 3)
        currentPlayer = 0;
      else
        currentPlayer++;
    }
  }
}

