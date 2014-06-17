// linked list of cards
class Hand {
<<<<<<< HEAD
  Card head, current, tail;
=======
  // current is the card that the user points to using arrow keys
  // first is the first card in the hand (farthest left)
  Card current, first;
  Card[] hand;
>>>>>>> 07ce0f0631cbd352d6059c78389759dd2b8a9e9a
  int size;
  int[] num;

  Hand() {
<<<<<<< HEAD
    head = null;
    current = head;
    tail = current;
=======
    current = null;
    first = null;
    hand = new Card[52];
>>>>>>> 07ce0f0631cbd352d6059c78389759dd2b8a9e9a
    size = 0;
    num = new int[13];
  }
  
  Hand(Card c) {
    head = c;
    current = c;
    tail = c;
    size = 1;
    num[c.getValue() - 1] ++;
  }

  boolean isEmpty() {
    return size == 0;
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
      first = c;
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
<<<<<<< HEAD
    head = c;
    num[c.getValue() - 1]++;
=======
    hand[size] = c;
>>>>>>> 07ce0f0631cbd352d6059c78389759dd2b8a9e9a
    size++;
    num[c.getValue() - 1]++;
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
      // remove card from array hand
      size--;
      num[c.getValue() - 1]--;
    return c;
  }
  
  Card removeFirst() {
    Card temp = head;
    head = head.getNext();
    return temp;
  }
    

  Card getCurrent() {
    return current;
  }

  void setCurrent(Card c) {
    current = c;
  }

  void displayHand() {
    Card tmp = first;
    for (int i=0; i<size; i++) {
      if (current.equals(tmp)) {
        image(tmp.getImage(), i*(1000/size), 475);
      } else {
        image(tmp.getImage(), i*(1000/size), 500);
      }
      tmp = tmp.getNext();
    }
  }

  void orderHand() {
    hand = mergeSort(hand);
    current = first = null;
    for (int i=0; i<size; i++) {
      insert(hand[i]);
    }
  }

  Card[] mergeSort(Card[] d) {
    if (d.length <= 1) {
      return d;
    } else {
      Card[] d1 = new Card[52];
      Card[] d2 = new Card[52];
      int half = d.length / 2;
      int d1Count = 0, d2Count = 0;
      for (int i=0; i<half; i++) {
        if (i < half) {
          d1[d1Count] = d[i];
          d1Count++;
        } else {
          d2[d2Count] = d[i];
          d2Count++;
        }
      }
      d1 = mergeSort(d1);
      d2 = mergeSort(d2);
      return merge(d1, d2);
    }
  }
  
  Hand mergeSort(Hand h) {
    if (h.getSize() <= 1) {
      Hand retH = new Hand(h.getCurrent());
      return retH;
    } 
    else {
      Hand h1 = new Hand();
      Hand h2 = new Hand();
      int half = size / 2;
      //int h1Count = 0, h2Count = 0;
      for (int i=0; i<half; i++) {
        if (i < half) {
          h1.insert(current);
          current = current.getNext();
          //d1Count++;
        } else {
          h2.insert(current);
          current = current.getNext();
          //d2Count++;
        }
      }
      h1 = mergeSort(h1);
      h2 = mergeSort(h2);
      return merge(h1, h2);
    }
  }

  Card[] merge(Hand h1, Hand h2) {
    Hand sorted = new Hand();
    
    /*int d1Count = 0, d2Count = 0;
    for (int i=0; i<52; i++) {
      if (d1Count == d1.length) {
        sorted[i] = d2[d2Count];
        d2Count++;
      } else if (d2Count == d2.length) {
        sorted[i] = d1[d1Count];
        d1Count++;
      } else if ( d2[d2Count].compareTo(d1[d1Count]) < 0) {
        sorted[i] = d1[d1Count];
        d1Count++;
      } else {
        sorted[i] = d2[d2Count];
        d2Count++;
      }
    } */
    while ( h1.getSize() > 0 && h2.getSize() > 0 ) {
      if ( h1.getCurrent() < h2.getCurrent() ) {
        Card temp = h1.removeFirst();
        sorted.insert(temp);
      }
      else {
        Card temp = h2.removeFirst(); 
        sorted.insert(temp);
      }
    }
   while ( h1.getSize() > 0 ) {
       Card temp = h1.removeFirst();
        sorted.insert(temp);
   }
   while ( h1.getSize() > 0 ) {
     Card temp = h2.removeFirst(); 
     sorted.insert(temp);  
   }
    return sorted;
  }

  Card[] merge(Card[] d1, Card[] d2) {
    Card[] sorted = new Card[52];
    int d1Count = 0, d2Count = 0;
    for (int i=0; i<52; i++) {
      if (d1Count == d1.length) {
        sorted[i] = d2[d2Count];
        d2Count++;
      } else if (d2Count == d2.length) {
        sorted[i] = d1[d1Count];
        d1Count++;
      } else if ( d2[d2Count].compareTo(d1[d1Count]) < 0) {
        sorted[i] = d1[d1Count];
        d1Count++;
      } else {
        sorted[i] = d2[d2Count];
        d2Count++;
      }
    }
    return sorted;
  }
}

