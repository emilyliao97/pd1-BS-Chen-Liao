class Discards {
  Card top;
  int size;

  Discards() {
    top = null;
    size = 0;
  }

  int getSize() {
    return size;
  }

  void setTop(Card c) {
    top = c;
    size++;
  }

  Card getTop() {
    return top;
  }

  void reset() {
    top = null;
    size = 0;
  }
  
}

