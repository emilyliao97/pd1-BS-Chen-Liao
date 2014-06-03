class Deck {
  Card[] deck;

  // creates the entire deck in order
  Deck() {
    deck = new Card[52];
    int cardNum = 0;
    for (int val=0; val<13; val++) {
      for (int suit=0; suit<4; suit++) {
        deck[cardNum] = new Card(suit, val);
      }
    }
  }
}

