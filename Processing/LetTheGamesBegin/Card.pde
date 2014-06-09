class Card {

  final static int SPADES = 3;
  final static int HEARTS = 2;
  final static int CLUBS = 1;
  final static int DIAMONDS = 0;
  //final static int JOKER = -1;

  final static int ACE = 1;
  final static int JACK = 11;
  final static int QUEEN = 12;
  final static int KING = 13;

  final int suit;
  final int value;

  Card next, prev;
  PImage img;

  Card(int v, int s) {
    suit = s;
    value = v;
    setImage();
  }

  int getValue() {
    return value;
  }

  int getSuit() {
    return suit;
  }

  void setNext(Card n) {
    next = n;
  }
  Card getNext() {
    return next;
  }
  void setPrev(Card p) {
    prev = p;
  }
  Card getPrev() {
    return prev;
  }

  String getSuitStr() {
    if (suit == 0)
      return "diamond";
    else if (suit == 1) 
      return "clover";  
    else if (suit == 2) 
      return "heart";
    else if (suit == 3)  
      return "spade";
    return "";
  }

  int compareTo(Card c) {
    if (this.getValue() > c.getValue())
      return 1;
    else if (this.getValue() < c.getValue())
      return -1;
    else { // values are equal
      if (this.getSuit() > c.getSuit())
        return 1;
      else
        return -1;
    }
  }

  void setImage() {
    String folder = "CardPics/";
    if (suit == CLUBS) {
      if (value < 10)
        img = loadImage(folder + "00" + value + "c.gif");
      else if (value <= 13) 
        img = loadImage(folder + "0" + value + "c.gif");
    } else if (suit == DIAMONDS) {
      if (value < 10) 
        img = loadImage(folder + "00" + value + "d.gif");
      else if (value <= 13) 
        img = loadImage(folder + "0" + value + "d.gif");
    } else if (suit == HEARTS) {
      if (value < 10) 
        img = loadImage(folder + "00" + value + "h.gif");
      else if (value <= 13) 
        img = loadImage(folder + "0" + value + "h.gif");
    } else if (suit == SPADES) {
      if (value < 10) 
        img = loadImage(folder + "00" + value + "s.gif");
      else if (value <= 13) 
        img = loadImage(folder + "0" + value + "s.gif");
    }
  }
}

