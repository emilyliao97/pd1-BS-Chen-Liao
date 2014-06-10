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
  
}
