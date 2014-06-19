pd1-BS-Chen-Liao
================

Members: Jane Chen and Emily Liao

Description:
A card game of lies and calling BS on your computer. :)

Instructions:
Simply run the sketch in Processing to start the game. The text colored blue shows whose turn it is. The starting player of the game is chosen randomly. Under the deck, there is text stating which card should be placed down during that turn, starting with ACE and ending with KING.
The controls are simple:
- press enter when it isn't your turn so the computer players can make their moves
- press the left and right arrow keys to scroll through your hand when it is your turn
- press the up arrow key to discard the chosen card


What works:
- Players take turns to discard a card
- The call function properly points out what card should be placed down--whether you put it down or not, as in the game, is up to the player. 



What doesn't work:
- The original Game.pde file did not compile because of the file name ("The nested type Game cannot hide an enclosing type"), so we renamed it LetTheGamesBegin.pde, which also renamed the folder.
- The sorting functionality we orignally placed in the game did not work, as it would take too much time, and Processing would freak out.
- As of now, the computer players do not always discard cards or take all the cards from the discard pile.



Data structures used:
- stack for Discards class
- linked list for Hand class
- node for Card class
- array for Deck class

Other highlights:
