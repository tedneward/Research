title=Avail Programming Language
tags=language, jvm
summary=Multi-paradigmatic general purpose programming language (and environment) emphasizing support for articulate programming.
~~~~~~

[Website](http://www.availlang.org/) | [Github](https://github.com/AvailLang/Avail.git)

Hunt the Wumpus, in Avail:
```
Public method "Play Wump the Wumpus with reader_with reporter_" is
[
    reader : []→string,
    writer : [string]→⊤
|
    /* Set up the game's I/O. */
    Wump the Wumpus reader := reader;
    Wump the Wumpus reporter := writer;
    /* Create a new game. All references to game objects within the block are
     * implicitly understood as relative to this new game.
     */
    newGame ::= a game of Wump the Wumpus;
    Use newGame as the implied game and do
    [
        Welcome;
        Look around, having just entered;
        Until the game is over, do
        [
            Give the agent a turn;
            Give the first swarm a turn;
            Give the second swarm a turn;
            Give the wumpus a turn;
        ];
        If the agent is alive then
        [
            If the wumpus is dead then [Report victory;]
            else [Report cowardice;];
        ]
        else [Report defeat;];
        Goodbye;
    ];
] : ⊤;
```

