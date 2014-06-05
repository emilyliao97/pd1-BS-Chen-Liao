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
  
  // d for deck
  Card[] mergeSort(Card[] d) {
    if (d.length <= 1) {
      return d;
    }
    else {
      Card[] d1 = new Card[52];
      Card[] d2 = new Card[52];
      int half = d.length / 2;
      int d1Count = 0, d2Count = 0;
      for (int i=0; i<half; i++) {
        if (i < half) {
          d1[d1Count] = d[i];
          d1Count++;
        }
        else {
          d2[d2Count] = d[i];
          d2Count++;
        }
      }
      d1 = mergeSort(d1);
      d2 = mergeSort(d2);
      return merge(d1,d2);
    }
  }
  
  Card[] merge(Card[] d1, Card[] d2) {
    Card[] sorted = new Card[52];
    int d1Count = 0, d2Count = 0;
    for (int i=0; i<52; i++) {
      if (d1Count == d1.length) {
        sorted[i] = d2[d2Count];
        d2Count++;
      }
      else if (d2Count == d2.length) {
        sorted[i] = d1[d1Count];
        d1Count++;
      }
      else if ( d2[d2Count].compareTo(d1[d1Count]) < 0) {
        sorted[i] = d1[d1Count];
        d1Count++;
      }
      else {
        sorted[i] = d2[d2Count];
        d2Count++;
      }
    }
    return sorted;
  }
  
  void shuffle() {
    for (int i = 0; i < 100; i++) {
      int rand = (int) (Math.random() * 52);
      Card temp = deck[i];
      deck[i] = deck[rand];
      deck[rand] = temp;
    }
  }
  
}

