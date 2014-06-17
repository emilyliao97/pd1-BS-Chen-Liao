class Player {

  Hand mine;
  int percentBS;

  Player() {
    mine = null;
    percentBS = 0;
  }

  Player(Hand dealt) {
    mine = dealt;
    percentBS = 0;
  }

  Hand getMine() {
    return mine;
  }

  void take(Card c) {
    mine.insert(c);
  }

  void takeDis(Discards d) {
    Card now = d.getTop();
    for ( int i = 0; i < d.getSize (); i++ ) {
      take(now);
      now = d.getTop().getNext();
    }
  }
<<<<<<< HEAD
  
  void setBS(int i) {
    percentBS = 100;
  }
  
  int calcBS() {
    for (int i = 0; i< 13; i++ ) {
      if (mine.getNum()[i] == 4) 
        percentBS = 100;
    }
    if (percentBS == 0) {
      int rand = (int) random(50);
      percentBS = rand;
    }
    return percentBS;
  }
  
  /*void compPlay(Discards d, int i) {
    mine.sort();
    if (d.getSize() > 7 && mine.getNum()[i] == 
  } */
  
=======
>>>>>>> 07ce0f0631cbd352d6059c78389759dd2b8a9e9a
}

