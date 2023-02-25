title=Chess (Variants)
tags=gamedev
summary=A collection of links and ideas for chess variants.
~~~~~~

## Variants ([Wikipedia list](https://en.m.wikipedia.org/wiki/List_of_chess_variants) or [Chess Variants.com](https://www.chessvariants.com/rindex.html))

### [Bughouse Chess](https://www.chess.com/terms/bughouse-chess) (aka Siamese Chess, Swap Chess, Exchange Chess)

Bughouse is played by two teams of two players each. In each team, one person plays as White and the other plays as Black.

When playing over the board, the two chessboards used are set side-by-side, so teammates sit together.

Bughouse games are usually played with blitz time controls. This is important because, as you will see, players can wait for their teammate to provide them with an extra piece before playing their next move.

Time is not shared among teams, so each board has its own clock. Both clocks are started simultaneously as the game begins, and then the players on each board control their own clocks.

Usually, if time runs out for a player, the game ends, and the other team wins. Sometimes, though, when people are playing over the board, they can decide that the game on the other board can continue.

Capturing is one of the most fun and thrilling aspects of Bughouse.

Remember that players from the same team play as different colors? Well, once you capture one of your opponent's pieces, you can give that piece to your partner. Your teammate then can keep that piece reserved for later. At any point, they can use their move to put the captured piece on the board and use it to their advantage! This procedure is called "dropping" a piece. Note, however, that players cannot drop pawns on the first or eighth ranks.

Pawn promotion in Bughouse occur just like in regular chess. When a pawn reaches the farthest rank from where it started (eight rank for White, first rank for Black), it can promote to any minor or major piece. After you capture a promoted pawn, your teammate will receive the original pawn and not the piece it becomes after the promotion.

### [Fog of War Chess](https://www.chess.com/terms/fog-of-war-chess)

Fog of War is a chess variant originally proposed by Jens Bæk Nielsen and Torben Osted in 1989 under the name of Dark Chess. In this variant, players can see only the squares where their pieces can legally move. Players can't see which enemy piece captures one of their own unless at least one other piece is "looking" at the square where the capture takes place. The same is true for pawn promotions--players can only see that an opponent has promoted if they have a piece eyeing the promotion square.

The rules of Fog of War chess are mostly the same as standard chess. The only (and crucial) difference is the absence of checks or checkmates in this variant. The game only ends when one of the kings is captured. This difference has a few implications. Players can move their king into an attacked square since there are no checks. Likewise, there are no stalemates--if a king can move to only attacked squares, it must do so and allow itself to be captured.

### [Gothic Chess](https://www.chess.com/terms/gothic-chess)

Plays on a 10x8 board. Adds two new pieces:

* The archbishop has the combined movements of the bishop and the knight. When moving like a knight, it can jump over other pieces, but it can't hop over obstacles when moving like a bishop.

* The chancellor combines the movements of the rook and knight. Like the archbishop, the chancellor can only jump over other pieces when moving like a knight.

White's board looks like:

```
P P P P P P P P P P
R K B Q C ! A B K R
```

C = Chancellor
A = Archbishop
! = King

### [Military Chess](https://www.chessvariants.com/wargame.dir/militarychess.html)

"The game is played on a checkered eight by eight board. In the middle, there is a river with four bridges where the river can be crossed; these bridges are between squares a4 and a5, c4 and c5, f4 and f5, and h4 and h5. Each side has two minefields; the minefields are between squares d2 and e2; d4 and e4; d5 and e5; and d7 and e7.

"Players have twelve pieces:

* A general, who acts like a chess king.
* Two cannons, who move one square horizontally, vertically or diagonally (i.e., like a chess king), but can also fire at enemy pieces that are at most three squares away.
* One tank, who moves like a chess rook.
* One bazooka-man, who move like a chess queen, but at most three squares
* One jeep, who moves like the bazooka-man, i.e., a chess queen but at most three squares,
* Two infantry, who move like a chess queen, but at most two squares
* Four advanced guards, who move one or two squares in any direction except backwards (I assume this means diagonally forwards, sideways, or straight forwards).

![](https://www.chessvariants.com/wargame.dir/militarychess.png)

"These moves are limited by the bridges and the mines. It seems reasonable to assume that one must cross the river by a bridge, and one cannot cross the minefields.

"I assume that each piece takes as it moves, except for cannons, who also can take pieces by firing: probably, a cannon does not move when firing, but instead removes the attacked piece.

"From a picture at the Boardgamegeek website, one can guess the following on the opening setup:

* The advanced guards are at lines 2 and 7, i.e., at positions a2, c2, f2 and h2; and a7, c7, f7 and h7, respectively.
* The cannons are in the corners: at a1, a8, h1, h8.
* The infantery are at b1, g1, b8, g8.
* The tanks are at c1 and f8.
* The generals are at d1 and e8. (Shown in the diagram as a king.)
* The bazooka-men are at e1 and d8. (Shown in the diagram as a rotated queen.)
* The jeeps are at f1 and c8. (Also shown in the diagram as a rotated queen.)

![](https://www.chessvariants.com/wargame.dir/militarychess2.png)

"Another setup might also be possible: place the king between the two "queen-like" pieces, i.e., between the bazooka-man and the jeep. I.e., use the following setup."

![](https://www.chessvariants.com/wargame.dir/militarychess3.png)

### Patented Military Chess

#### [Patent 186181](https://patents.google.com/patent/US186181A/en):

> a game board with seventy two squares and ten game pieces for each of the two players. The pieces for each player include:
> (a) a miniature foot soldier, representing infantry (six pieces),
> (b) a miniature horse and rider, representing cavalry (two pieces), and
> (c) a miniature cannon, representing artillery (two pieces).
> The infantry moves one square in any direction; the cavalry moves three squares in any direct ion; and the artillery moves two squares in straight lines only. One player's pieces are light colored and the other player's pieces are dark colored.

#### Patent 2414165:

A preferred game board with one hundred twenty one alternately colored squares. Paschal says the game can be played on a standard chess board with sixty four squares, "but the strategy of the game is cramped thereby" (column 6, lines 35, 36). The pieces for each player are miniature replicas of:

(a) an airplane carrier (one piece),
(b) a transport vessel (one piece),
(c) a battleships (one piece),
(d) a destroyer (one piece),
(e) a submarine (one piece),
(f) an airplane (two pieces),
(g) a torpedo (four pieces), and
(h) a shell (five pieces).
The airplane carrier and the battleship are large enough to occupy two squares. The miniature ships are marked to indicate their armament and to indicate their vulnerability to being sunk by an opponent. The rules provide for the movement capabilities of the pieces.

#### [Patent 2400644](https://patents.google.com/patent/US2400644A/en):

A game board with ninety six alternately colored squares, twelve along one side and eight squares along an adjacent side. Eighteen game pieces, miniature replicas of military personnel and equipment, are provided for each of the two players:

(a) infantrymen (eight pieces)
(b) anti-aircraft guns (two pieces)
(c) light tanks (two pieces)
(d) heavy tanks (two pieces)
(e) airplanes (two pieces)
(f) heavy artillery (two pieces)

Hoffman provides a "smokescreen" in the center of the board to prevent opposing players from observing the initial deployment of the enemy forces. The "smokescreen" is removed after the opposing forces have been deployed and the players alternately move their pieces according to the rules of Hoffman's game. The infantry pieces move the same as pawns in chess. All of Hoffman's other pieces move differently than chess pieces.

#### [Patent 5484157](https://patents.google.com/patent/US5484157))
The rules of chess apply except that the military pieces are enabled to move in a manner simulating movement of military equipment, which enables the players to combine military strategy with chess-like logic.

8x8 board

Each player initially has an "army" comprising sixteen correspondingly colored military playing pieces, comprising:

(a) Six military pieces simulating a combat soldier, designated as "Infantry Forces" 

(b) Two military pieces simulating a small tank, designated "Calvary Tank Brigades" 

(c) Two military pieces simulating a large armored tank, designated "Armored Tanks" 

(d) Two military pieces simulating a fighter plane, designated "Fighter Planes" 

(e) Two military pieces simulating a helicopter, designated "Attack Helicopters"

(f) One military piece simulating a bomber, designated "Bomber Plane"

(g) One military piece simulating an army headquarters building, designated "Command Headquarters"

The players move in alternating turns, as in standard chess, a piece or pieces in continuing efforts to capture enemy pieces while protecting their own. During a move, the moving piece may capture an enemy military piece by moving, in accordance with rules requiring limited movement, to a square occupied by the enemy's piece. The enemy piece is removed and the moving piece occupies that space.

### [Luzhanqi (Army Chess)](https://www.ymimports.com/pages/how-to-play-luzhanqi)

Different squares on the board have "terrain" effects that affect the pieces within them and attacking them.

* "Soldier station": Normal
* "Campsite": Pieces cannot be attacked in this site.
* "HQ": The Flag is held here.
* "Front line": These mark the boundary between both sides. Pieces do not land on these spaces, they pass over them.
* "Mountains": These are obstacles that cannot be moved onto. Pieces must move around them over the Front Line.
* "Railroads": Pieces can move any number of playing spaces along a railroad in a straight line, as long as it is not obstructed by another piece. Engineer pieces can move around the railroad corners as well.
* "Road": Pieces move from one space to another along these roads.

Pieces are ranked a la Stratego (rank 1 down to rank 9). Higher rank kills lower rank; ties unknown.

### [Shogi (Japanese Chess)](https://www.ymimports.com/pages/how-to-play-shogi)

### [Jungle Chess](https://www.ymimports.com/pages/how-to-play-jungle)

### [Aeroplane Chess](https://www.ymimports.com/pages/how-to-play-aeroplane-chess-fei-xing-qi)

### [Xiangqi (Chinese Chess)](https://www.ymimports.com/pages/how-to-play-xiangqi-chinese-chess)

### [Three-Player Chess](https://www.ymimports.com/pages/how-to-play-three-player-chess)

