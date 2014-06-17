class Discards {
  int top;
  Card[] stack;

  Discards() {
    stack = new Card[52];
    top = -1;
  }

  // push
  void addCard(Card c) {
    top++;
    stack[top] = c;
  }

  // pop
  Card removeCard() {
    Card tmp = stack[top];
    top--;
    return tmp;
  }

  // peek
  Card getTop() {
    return stack[top];
  }
  
  int getSize() {
    return top + 1;
  }
  
  void displayDiscards() {
    if (getSize() > 0) {
      PImage img = loadImage("CardPics/Back_1.jpg");
      image(img,450,200);
    }
    
  }
}

