// doubly linked list of cards
class Hand extends Deck {
  
  Card current;
  int size;
  
  public void insert(Card c) {
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
    if (current == null || current.next == current.prev)
      current = null;
    else {
      current.next.prev = current.prev;
      current.prev.next = current.next;
      current = current.next;
    }
    // later when the discard pile class is created
    // add the discarded card to the top of that pile
  }
  
  Card getCurrent() {
    return current;
  }
  
}
