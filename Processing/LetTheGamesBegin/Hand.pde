// doubly linked list of cards
class Hand {
  
  Card current;
  int size;
  int[] num;
  
  Hand() {
    current = null;
    size = 0;
    num = new int[13];
  }
  
  boolean isEmpty() {
    return (size == 0);
  }
  
  int getSize() {
    return size;
  }
  
  int[] getNum() {
    return num;
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
    num[c.getValue() - 1]++;
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
    num[c.getValue() - 1]--;
    size--;
    return c;
  }
  
  Card getCurrent() {
    return current;
  }
  
}
