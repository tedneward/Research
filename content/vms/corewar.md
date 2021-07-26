title=Core War
tags=vm, gamedev
summary=A reproduction of the Core War game. Assembly compiler, Virtual Machine and GUI.
~~~~~~

[Source](https://github.com/emilwallner/Corewar)

Core War was inspired by a malicious virus written in the 80’s. To deal with the self-replicating virus, a white hat hacker invented Reaper. It was a virus designed to spread and eliminate the malware. He fought fire with fire.

This inspired A. K. Dewdney to coin the idea for Core War.

The idea was simple. You compete by designing viruses to overtake a computer. You win by protecting your own program and overwriting your opponent's programs. This is all happening on a virtual computer. Think, a simple computer within your computer.

This is what is looks like in action:

![](https://camo.githubusercontent.com/ecdb2786375656c7e085c85e38421ea11946a2f553ce29a6817d2eb482307d85/687474703a2f2f672e7265636f726469742e636f2f7079794167675963576d2e676966)

Let’s focus on the high-level game dynamics:

* The game board, the memory of our virtual computer. It’s represented in a 64 X 64 grid of bytes.
* The players, small programs represented in different colors. The white parts have blank memory.
* Cursors, the moving parts with inverted color. They read from the game board.

The cursors have a couple of features. They can jump on the game board, store and write values, and clone themselves. The cursors belong to no-one, they just read from the game board.

When the game starts, all players have one cursor at the beginning of their program. The game advances as the cursors read the commands stored in their programs. If they end up on a faulty command or a blank memory, it moves to the next byte.

Below, we see how the pink player starts by cloning their cursors. It then starts attacking the blue player.

![](https://camo.githubusercontent.com/716b61e9b563a2925b9f89d6ba671a7d88c0eb2afceae9f26a7f368d7e7476c8/687474703a2f2f672e7265636f726469742e636f2f593972394537384656592e676966)

Let’s get into a little bit more depth.

Every byte you see, the pairs of numbers or letters, are represented in hexadecimal. Each hexadecimal has the value of a digit, from 0 - 255.

There are 16 operations in the game. The operations decide if the cursor should jump to a different address, clone itself and so on. The first 16 hexadecimal are coding bytes, they all store a different operation. The remaining digits, 17 - 255, are regular numbers.

The coding byte decides which operation to execute and how many bytes to read. In the image above, the pink player goes to the hexadecimal 0c. It's 12 in decimal, telling the cursor to clone itself. The two bytes after decide where the cloned cursor starts.

![](https://camo.githubusercontent.com/2998dc8f55ea9e1d22fbb9ce00389d9888e463acfe0852a2e5559b13d013454d/687474703a2f2f672e7265636f726469742e636f2f58516468566d717672562e676966)

There are three main components to determine who wins:

* Game rounds, every game round is measured in cycles. It determines how much each cursor can read from the game board.
* Lives, if a cursor reads a player life from the game board, they are given a life for that round. These are visualized in the colorful progress bars.
* Cycle to die, for every game round, the number of bytes a cursor can read from the game board is reduced.

You win if your program is the last one to receive a life.

There are more nuances to the game that I don’t cover. The best way to learn about them is to run it.
