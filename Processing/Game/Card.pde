class Card {
  int suit, value;

  Card() {
    suit = 0;
    value = 1;
  }

  // s is an int between 0 and 3
  // v is an int between 1 and 13
  Card(int s, int v) {
    suit = s;
    value = v;
  }
}

