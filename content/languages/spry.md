title=Spry
tags=language
summary=A Smalltalk and Rebol inspired language implemented as an AST interpreter in Nim.
~~~~~~

[Website](http://sprylang.se/) | [Language Source](https://github.com/gokr/spry) | [VM Source](https://github.com/gokr/spryvm)

Characteristics:

* A dynamically typed minimalistic language with a free form syntax similar to Rebol/Forth
* Parser produces an AST which in turn is interpreted by the interpreter
* Functional in nature and has closures and non local return
* Homoiconic which means code and data has the same form
* Meant to be 100% live and support interactive development

## Examples
GUI To-Do list:

```
#!/usr/bin/env spry

# A sample Spry application that is a trivial todolist app
# using a RocksDB as storage.

# First we need to initialize libui. Since spry and ispry
# has the spryui VM module built in, we have access
# to a set of words for libui. One is a func called uiInit
# that needs to be called to initialize libui.
# Calling a func (Spry function) is done simply by writing
# it's name, no need for () at the end since Spry does not
# use parentheses for parameter passing.
uiInit

# Variable holding our rocksdb. We do not declare variables
# in Spry, we simply create them by assignment. Assignment is
# done using the "=" word. In Spry we have nil as default value,
# in this case we set it to nil, which in fact is not needed
# in this application, but it's nice to show our top level
# variables!
db = nil

# The current todolist. We initalize it to an empty "block".
# A block in Spry is a List/Array/OrderedCollection in other
# languages, that can grow dynamically. It's worth noting
# that blocks are created at parse time, so executing this
# line of code multiple times will not create multiple blocks!
todos = []

# Open database and load todos. We create functions using
# func [...].
openDB = func [
  # When assigning a variable in an outer scope, we need ..
  # The ":path" means "pull in first parameter to this function
  # and call it path.
  db := openRocksDB :path
  # The way precedence works in Spry we currently need
  # parentheses sometimes, unfortunately.
  todos := (db rockAt: "todos")
  # Initialize as empty list or load existing list
  todos nil? then: [
    todos := []
    saveTodos
  ] else: [
    loadTodos
  ]
]

# Store in database
saveTodos = func [
  db nil? else: [
    db rockAt: "todos" put: todos
  ]
]

# Populate UI from the todolist
loadTodos = func [
  todos do: [addToList :each]
]

# Close RocksDB and say bye befor exiting
byeBye = func [
  db nil? else: [db closeRocksDB]
  win message: "Bye bye" title: "Todolist"
]

# Given a todo of the form {id = 7 text = "blabla"} we create
# a row with a label of the text and a delete button.
newTodoRow = func [:todo
  row = newHorizontalBox
  label = newLabel: todo::text
  # The delete button is tricky. First we need to pass
  # a func (closure) instead of a pure block, otherwise
  # we do not close over the todo parameter.
  # Secondly, we need to find the index of the row to delete
  # which we do by searching for the index of the todo with this
  # unique id. The id is generated in the addButton by using a
  # max + 1 trick to make sure it's not a duplicate id.
  deleteButton = newButton: "Delete" onClicked: func [
    id = todo::id
    idx = (todos findIndex: func [:each each::id == id])
    todoRows delete: idx
    todos removeAt: idx
    saveTodos
  ]
  row add: label stretch: true
  row add: deleteButton stretch: false
  ^row
]

addToList = func [
  # Why is paren needed?
  todoRows add: (newTodoRow :todo) stretch: false
]

# Build Window
menu = newMenu "File"

# Open an existing RocksDB
menu addItem: "Open ..." onClicked: [
  path = (win openFile)
  path nil? else: [
    openDB path
  ]
]

# Making a new RocksDB
menu addItem: "New ..." onClicked: [
  path = (win saveFile)
  path nil? else: [
    openDB path
  ]
]

# Add a Quit item in menu
menu addQuitItemShouldClose: [
  byeBye
  win destroy
  uiQuit
  ^true
]

# Construct the application window
win = newWindow: "Todolist" width: 240 height: 400 hasBar: true
win margined: true

layout = newVerticalBox
todoRows = newVerticalBox
addTodo = newHorizontalBox

# Pick out text from the text entry field, create
# a todo (a Map), add it to the todos, and add a row in the UI.
# Finally saveTodos.
addButton = newButton: "Add" onClicked: func [
  text = (addText text)
  todo = {
    text = text
    id = ((todos max: [:todo todo::id] default: 0) + 1)
  }
  todos add: todo
  addToList todo
  saveTodos
]

addText = newEntryText: "Some stuff" onChanged: []

layout padded: true
group = newGroup "Todolist"
group
  margined: true;
  setChild: layout

# Wohoo, we can actually do cascades in Spry!
layout
  add: todoRows stretch: true;
  add: addTodo stretch: false

addTodo
  add: addText stretch: true;
  add: addButton stretch: false

win
  setChild: group;
  onClosingShouldClose: [byeBye true];
  show;
  uiMain
```