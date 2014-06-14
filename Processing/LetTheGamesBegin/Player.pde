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
  
  int pBS() {
    for ( int i = 0; i < 13; i++ ) {
      if ((mine.getNum())[i] == 4)
        percentBS = 100;   
    }
    return percentBS;
  }
  
}
