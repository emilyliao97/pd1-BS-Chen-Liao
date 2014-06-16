// doubly linked list of cards
class Hand {
  Card current;
  int size;
  
  Hand() {
    current = null;
    size = 0;
  }
  
  boolean isEmpty() {
    return size == 0;
  }
  
  int getSize() {
    return size;
  }
  
  void insert(Card c) {
    if (current == null) {
      current = c;
      c.next = c;
      c.prev = c;
    }
    else {
      c.next = current;
      c.prev = current.prev;
      if (current.prev != null) {
        current.prev.next = c;
      }
      current.prev = c;
      current = c;
    }
    size++;
  }
  
  // discards the current card
  Card discard() {
    Card c = current;
    if (current.next == current.prev) {
      current = null;
    }
    else {
      current.next.prev = current.prev;
      current.prev.next = current.next;
      current = current.next;
    }
    size--;
    return c;
  }
  
  Card getCurrent() {
    return current;
  }
  
  void setCurrent(Card c) {
    current = c;
  }
  
  void displayHand() {
    for (int i=0; i<size; i++) {
      image(current.getImage(),i*(1000/size),500);
      current = current.getNext();
    }
  }
  
}
