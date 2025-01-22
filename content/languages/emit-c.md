title=emiT-C
tags=language, esolang
summary=A time-traveling programming language.
~~~~~~

[Source](https://github.com/nimrag-b/emiT-C)

"emiT is a language all about parallel timelines. At any given point you can send a variable back in time, and make it change things about the past, starting a new timeline where the result is different. You can kill variables, which destroys them permanantly- at least until you send another variable back in time to kill the variable doing the killing. This very quickly leads to a lot of confusion, with a constantly changing source code and the very easy possibility of creating a paradox or a time loop. Remember, the timeline doesnt reset when you go back, any changes made before will remain until you go back even further to stop them from happening."

### Code Example
Lets say you create a variable and print the result.

```
create x = 10; 
print x; // prints 10
```

But then in the future, you wish you could change the result.

so you create a new variable and send it back in time to a specified point.

```
create x = 10;
time point;
print x; //prints 10 in first timeline, and 20 in the next

create traveler = 20;
traveler warps point{
    x = traveler;
};
```

You have gone back in time, and created a new timeline where x is set to 20 by the traveler

But theres still a problem. Two variables cannot exist at the same time. So in the second timeline, where the traveler already exists when we try to create it, we cause a paradox, collapsing the timeline. In this scenario, it wont make a difference since no more code executes after the traveler is created, but in anything more complex itll cause the immediate destruction of the timeline. So unfortunately, the traveler must kill itself to preserve the timeline

```
create x = 10;
time point;
print x; //prints 10 in first timeline, and 20 in the next

create traveler = 20;
traveler warps point{
    x = traveler;
    traveler kills traveler;
};
```

Of course, the traveler isnt only limited to killing itself, it can kill any variable.

```
create x = 10;
time point;
print x; //prints 10 in first timeline, and nothing in the next, since x is dead.

create traveler;
traveler warps point{
    traveler kills x;
    traveler kills traveler;
};
```

The final problem here is that this currently creates a time loop, as there is nothing to stop the traveler being created and being sent back in time during every timeline. The solution is simple, just check wether x is dead or not before creating the traveler.

```
create x = 10;
time point;
print x; //prints 10 in first timeline, and nothing in the next, since x is dead.

if(x is alive)
{

  create traveler;
  traveler warps point{
      traveler kills x;
      traveler kills traveler;
  };
};
```

There we go. A program that runs for two timelines and exits without creating a paradox or time loop.

During this, every timeline creates is still running, and as soon as the active timeline collapses, wether by paradox, or simply reaching the end of its instructions, itll jump back to the previous active timeline, and so on until every timeline has collapsed.
