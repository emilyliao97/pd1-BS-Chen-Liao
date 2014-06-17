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
    for ( int i = 0; i < d.getSize(); i++ ) {
      take(now);
      now = d.getTop().getNext();
    }
  }
  
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
  
  void compPlay(Discards d, int i) {
    if (d.getSize() > 7 && mine.getNum()[i-1] > 0) {
      mine.sort();
      while (mine.getCurrent().getValue != i)
        current = current.getNext();
      mine.discard();
    }
    else
      mine.discard();
  }
  
}

