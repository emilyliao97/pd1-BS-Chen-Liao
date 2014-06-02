public class Card {

    public final static int SPADES = 3;
    public final static int HEARTS = 2;
    public final static int CLUBS = 1;
    public final static int DIAMONDS = 0;
    public final static int JOKER = -1;

    public final static int ACE = 1;
    public final static int JACK = 11;
    public final static int QUEEN = 12;
    public final static int KING = 13;

    public final int suit;
    public final int val;

    public Card() {
	suit = JOKER;
	value = -1;
    }

    public Card(int v, int s) {
	suit = s;
	value = v;
    }

    public int getVal() {
	return val;
    }

    public int getSuit() {
	return suit;
    }

    public String getSuitStr() {
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