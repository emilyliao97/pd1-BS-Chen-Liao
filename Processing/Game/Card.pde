class Card {

    final static int SPADES = 3;
    final static int HEARTS = 2;
    final static int CLUBS = 1;
    final static int DIAMONDS = 0;
    final static int JOKER = -1;

    final static int ACE = 1;
    final static int JACK = 11;
    final static int QUEEN = 12;
    final static int KING = 13;

    final int suit;
    final int val;

    Card() {
	suit = JOKER;
	value = -1;
    }

    Card(int v, int s) {
	suit = s;
	value = v;
    }

    int getVal() {
	return val;
    }

    int getSuit() {
	return suit;
    }

    String getSuitStr() {
	if (suit = 0)
	    return "diamond";
	else if (suit = 1) 
	    return "clover";
	else if (suit = 2) 
	    return "heart";
	else if (suit = 3) 
	    return "spade";
    }

}
