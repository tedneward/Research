title=Mint
tags=language, presentation, browser
summary=A refreshing programming language for the front-end web.
~~~~~~

[Website](https://www.mint-lang.com/) | [Source](https://github.com/mint-lang/mint)

Example:
```
component Counter {
  state counter = 0

  fun increment {
    next { counter = counter + 1 }
  }

  fun decrement {
    next { counter = counter - 1 }
  }

  fun render {
    <div>
      <button onClick={decrement}>
        "Decrement"
      </button>

      <span>
        <{ Number.toString(counter) }>
      </span>

      <button onClick={increment}>
        "Increment"
      </button>
    </div>
  }
}
```



Data Management:
```
record Todo {
  label : String,
  done : Bool
}

store Todos {
  property items = [] of Todo

  fun add (todo : Todo) {
    next { items = Array.push(todo, items) }
  }

  fun delete (todo : Todo) {
    next { items = Array.delete(todo, items) }
  }
}

component TodoList {
  connect Todos exposing { add, delete }

  ...
}
```

Routing:
```
routes {
  / {
    Application.setPage(Page::Home)
  }

  /blog {
    Application.setPage(Page::Blog)
  }

  /blog/:slug (slug : String) {
    sequence {
      Posts.load(slug)
      Application.setPage(Page::Post)
    }
  }

  * {
    Application.setPage(Page::NotFound)
  }
}
```

Styling:
```
component TodoItem {
  property color = "#333"
  property label = ""
  property done = false

  style base {
    align-items: center;
    display: flex;
  }

  style label {
    font-weight: bold;
    color: #{color};
    flex: 1;

    if (done) {
      text-decoration: line-through;
    }
  }

  fun render {
    <div::base>
      <span::label>
        <{ label }>
      </span>

      <Icon.Checkmark/>
      <Icon.Trash/>
    </div>
  }
}
```
