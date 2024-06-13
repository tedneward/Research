title=Kitten
tags=language
summary=A statically typed concatenative systems programming language.
~~~~~~

[Website](http://kittenlang.org/) | [Source](https://github.com/evincarofautumn/kitten)

### Examples
[Hello user](https://github.com/evincarofautumn/kitten/blob/master/examples/hello-user.ktn)
```
"What is your name? " ask -> name;
"Hello, " print
name print
"!" say
```

[Tic-tac-toe](https://github.com/evincarofautumn/kitten/blob/master/examples/tictactoe.ktn):
```
play_game

////////////////////////////////////////////////////////////////////////////////
// Types
////////////////////////////////////////////////////////////////////////////////

type Board:
    case board_of_cells (List<Cell>)

type Cell:
    case vacant
    case occupied (Player)

type Player:
    case player_x
    case player_o

type Move:
    case mark (Int32, Int32)
    case forfeit

type Outcome:
    case continue_playing
    case tied
    case wins (Player)

////////////////////////////////////////////////////////////////////////////////
// Gameplay
////////////////////////////////////////////////////////////////////////////////

define play_game (-> +IO +Exit):
    do (while) { play_round maybe_play_again }

define play_round (-> +IO +Exit):
    new_game take_turns announce_winner print

define maybe_play_again (-> Bool +IO):
    "Play another game? [yN] " ask -> response;
    if (response is_yes):
        true
    elif (response empty | response is_no):
        false
    else:
        maybe_play_again

define take_turns (Board, Player -> Board, Optional<Player> +IO +Exit):
    -> current_player;
    match (dup outcome)
    case continue_playing:
        current_player take_turn
        current_player end_turn
        take_turns
    case wins: some
    case tied: none

define take_turn (Board, Player -> Board +IO +Exit):
    -> board, current_player;
    board print
    current_player announce_turn
    match (enter_move)
    case some:
        match
        case mark -> x, y:
            board x y current_player mark_board
            match
            case some {}
            case none:
                "Not a valid move." say
                board current_player take_turn
        case forfeit:
            0 exit
    case none:
        "I didn't understand that. Type, e.g., \"a3\" to \
        move in the bottom-left cell. Type \"q\" to exit." say
        board current_player take_turn

define end_turn (Player -> Player):
    match case player_x { player_o } case player_o { player_x }

define enter_move (-> Optional<Move> +IO):
    "Enter your move: " ask parse_move

define announce_turn (Player -> +IO):
    show ", it's your turn." cat say

define announce_winner (Optional<Player> -> +IO):
    match case none { "It's a tie!" } case some { show " wins!" cat } say

////////////////////////////////////////////////////////////////////////////////
// Board Operations
////////////////////////////////////////////////////////////////////////////////

define outcome (Board -> Outcome):
    -> board;
    possible_wins { board possible_winner } map concat_optionals -> winners;
    if (winners empty):
        continue_playing
    elif (winners \(= player_x) all):
        player_x wins
    elif (winners \(= player_o) all):
        player_o wins
    else:
        tied

define possible_winner (List<Int32>, Board -> Optional<Player>):
    board_cells swap get_all concat_optionals -> players;
    if (players \(= player_x occupied) all):
        player_x some
    elif (players \(= player_o occupied) all):
        player_o some
    else:
        none

define possible_wins (-> List<List<Int32>>):
    [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],  // Rows
        [0, 3, 6], [1, 4, 7], [2, 5, 8],  // Columns
        [0, 4, 8], [2, 4, 6],             // Diagonals
    ]

define mark_board (Board, Int32, Int32, Player -> Optional<Board>):
    -> current_player;
    cell_number -> number;
    number board_index -> index;
    board_cells
    do (with (+Fail)):
        match (dup index get "invalid index" from_some)
        case vacant:
            (current_player occupied) index set
            "invalid index" from_some board_of_cells some
        case occupied:
            drop2 none

////////////////////////////////////////////////////////////////////////////////
// Input
////////////////////////////////////////////////////////////////////////////////

define parse_move (List<Char> -> Optional<Move>):
    -> chars;
    do (with (+Fail)):
        if (chars length = 2):
            (chars 0 get "invalid move" from_some)
            (chars 1 get "invalid move" from_some)
            read_x_y
        // HACK: Needs generic instances.
        elif (chars length = 1 && { chars 0 get "invalid move" from_some = 'q' }):
            forfeit some
        else:
            none

define read_x_y (Char, Char -> Optional<Move>):
    match (dup2 try_read_x_y)
    case some: \drop2 dip some
    case none: swap try_read_x_y

define try_read_x_y (Char, Char -> Optional<Move>):
    \read_x \read_y both \mark lift_optional_2

define read_x (Char -> Optional<Int32>):
    -> c;
    if   (c "aA" elem): 0 some
    elif (c "bB" elem): 1 some
    elif (c "cC" elem): 2 some
    else:                 none

define read_y (Char -> Optional<Int32>):
    -> c;
    if   (c "1!" elem): 0 some
    elif (c "2@" elem): 1 some
    elif (c "3#" elem): 2 some
    else:                 none

////////////////////////////////////////////////////////////////////////////////
// Output
////////////////////////////////////////////////////////////////////////////////

instance show (Board -> List<Char> +Fail):
    -> board;
    "  --+-+--\n" -> divider;
    "   A B C\n" -> heading;
    [
        heading, "1 ", board 0 show_row, "\n",
        divider, "2 ", board 1 show_row, "\n",
        divider, "3 ", board 2 show_row, "\n",
    ] concat

define show_row (Board, Int32 -> List<Char> +Fail):
    (* 3) -> row_index;
    -> board;
    [
        " ", board (0 + row_index) show_cell,
        "|", board (1 + row_index) show_cell,
        "|", board (2 + row_index) show_cell,
    ] concat

define show_cell (Board, Int32 -> List<Char> +Fail):
    \board_cells dip board_index get
    "invalid board index" from_some show

instance show (Player -> List<Char>):
    match
    case player_x: "X"
    case player_o: "O"

instance show (Cell -> List<Char>):
    match
    case vacant:   " "
    case occupied: show

////////////////////////////////////////////////////////////////////////////////
// Constants and Helpers
////////////////////////////////////////////////////////////////////////////////

define new_game (-> Board, Player):
    empty_board first_player

define empty_board (-> Board):
    vacant 9 replicate board_of_cells

define first_player (-> Player):
    player_x

define is_yes (List<Char> -> Bool):
    { "yY" elem } any

define is_no (List<Char> -> Bool):
    { "nN" elem } any

define board_cells (Board -> List<Cell>):
  match case board_of_cells {}

// Converts an (x, y) position to a cell number.
define cell_number (Int32, Int32 -> Int32):
    -> x, y; 3 * y + x

// Converts a cell number to a board index.
define board_index (Int32 -> Int32):
    (8 -)

////////////////////////////////////////////////////////////////////////////////
// Hacks and Workarounds
////////////////////////////////////////////////////////////////////////////////

// HACK: Should be derived automatically.
instance = (Player, Player -> Bool):
  match
  case player_x: match case player_x { true } case player_o { false }
  case player_o: match case player_x { false } case player_o { true }

// HACK: Should be derived automatically.
instance = (Cell, Cell -> Bool):
  -> cx, cy;
  match (cx)
  case occupied -> x: match (cy) case occupied -> y { x = y } else { false }
  case vacant: match (cy) case vacant { true } else { false }
```

https://github.com/evincarofautumn/kitten
A statically typed concatenative systems programming language. Kitten is a statically typed, stack-based functional programming language designed for simplicity, speed, and safety. This is an in-progress implementation of that language, including: An interactive console for testing code; An interpreter; A native-code compiler producing static executables (incomplete).
