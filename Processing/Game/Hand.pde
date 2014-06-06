// doubly linked list of cards
class Hand {
  
  Card current;
  int size;
  
  boolean isEmpty() {
    return (size == 0);
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
      if (current.prev != null)
        current.prev.next = c;
      current.prev = c;
      current = c;
    }
  }
  
  void discard() {
    if (current.next == current.prev) {
      // add current to discard pile
      current = null;
    }
    else {
      // add current to discard pile
      current.next.prev = current.prev;
      current.prev.next = current.next;
      current = current.next;
    }
  }
  
  /*
  void addDiscards() {
    
  }
  if BS, add the discard pile into this hand
  */
  
  Card getCurrent() {
    return current;
  }
  
}
