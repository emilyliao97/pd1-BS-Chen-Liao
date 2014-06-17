class Deck {
  Card[] deck;
  Hand p1;
  Hand p2;
  Hand p3;
  Hand p4;

  // creates the entire deck in order
  Deck() {
    deck = new Card[52];
    int cardNum = 0;
    for (int val=1; val<=13; val++) {
      for (int suit=0; suit<4; suit++) {
        deck[cardNum] = new Card(val, suit);
        cardNum++;
      }
    }
    p1 = new Hand();
    p2 = new Hand();
    p3 = new Hand();
    p4 = new Hand();
  }

  Hand getp1() {
    return p1;
  }

  Hand getp2() {
    return p2;
  }

  Hand getp3() {
    return p3;
  }

  Hand getp4() {
    return p4;
  }

  void shuffle() {
    for (int i = 0; i < 52; i++) {
      int rand = (int) random(52);
      Card temp = deck[i];
      deck[i] = deck[rand];
      deck[rand] = temp;
    }
  }

  void deal() {
    shuffle();
    for (int i = 0; i < 52; i+=4) {
      p1.insert(deck[i]);
      p2.insert(deck[i+1]);
      p3.insert(deck[i+2]);
      p4.insert(deck[i+3]);
    }
  }
  
}

