title=Concurnas
tags=jvm, language
summary=An open source JVM programming language designed for building reliable, scalable, high performance concurrent, distributed and parallel systems.
~~~~~~

[Website](https://concurnas.com/) | [Github](https://github.com/Concurnas/Concurnas)

## Actors
Actors in Concurnas enable us to build micro-services. Each actor operates within its own dedicated isolate. Actors look and behave just like regular objects from the perspective of the calling code.

Actors allow us to write service code in a single threaded style and be able to run them safety in a concurrent manner without having to concern ourselves with synchronization or race conditions as each call to an actor runs sequentially and has exclusive access to the sate of the actor until it completes. Naturally, because actors implement their own concurrency control they are safe to be shared without copying across multiple isolates.
```
actor MyActor{ //lets define an actor
  -count = 0
  def increment(){
    count++
  }
}

//Use of the above actor:
ma = new MyActor()

ma.increment()//just like normal method call, will block until execution is complete

sync{//sync - wait for all isolates created in the block to complete
  {ma.increment()}!//called concurrently
  {ma.increment()}!
}

count = ma.getCount()
//count == 3, not possible with regular objects!
```

## Typed Actors
Sometimes we do not have the luxury of defining actors from scratch. This is particularly the case if we are working with pre existing code. To this end Concurnas provides typed actors. Typed actors construct their own and wrap around an instance of an ordinary object.

Any constructor used to create an instance of the class or method being wrapped is also provided by the typed actor.
```
class MyCounter(-count int){//ordinary class
  def increment(){
    count++
  }
}

//We can now define and use our typed actor through the aid of the of keyword as follows:
actor MyActor of MyCounter(0)


//let's use our new typed actor:
ma = new MyActor()

ma.increment()

sync{//sync - wait for all isolates created in the block to complete
  ma.increment()!
  ma.increment()!
}

count = ma.count//count == 3
```

## Default Actors
Another way to create a typed actor is to simply use the actor keyword in place of or in addition to the new keyword when creating an instance of an object (now and actor!).
```
class MyCounter(-count int){
  def increment(){
    count++
  }
}

inst1 = actor MyCounter(0)      //create a new actor on MyCounter
inst2 = new actor MyCounter(0)  //create a new actor on MyCounter
```
