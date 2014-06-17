// linked list of cards
class Hand {
  Card head, current;
  int size;
  int[] num;

  Hand() {
    head = new Card();
    current = null;
    size = 0;
    num = new int[13];
  }

  boolean isEmpty() {
    return size == 0;
  }

  int getSize() {
    return size;
  }
  
  int[] getNume() {
    return num;
  }

  void insert(Card c) {
    if (current == null) {
      current = c;
      c.next = c;
      c.prev = c;
    } else {
      c.next = current;
      c.prev = current.prev;
      if (current.prev != null) {
        current.prev.next = c;
      }
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
    } else {
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

  void setCurrent(Card c) {
    current = c;
  }

  void displayHand() {
    Card tmp = current;
    for (int i=0; i<size; i++) {
      if (current.equals(tmp)) {
        image(current.getImage(), i*(1000/size), 475);
      } else {
        image(current.getImage(), i*(1000/size), 500);
      }
      current = current.getNext();
    }
  }

  void keyPressed() {
    displayHand();
    if (key == LEFT) {
      current = current.getPrev();
      background(0);
    } else if (key == RIGHT) {
      current = current.getNext();
      background(255);
    } else if (key == UP) {
      discard();
      current = current.getNext();
    }
  }
  
}

