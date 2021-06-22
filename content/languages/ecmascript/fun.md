title=Fun
tags=language, browser, presentation
summary=Programming language for the realtime web.
~~~~~~

[Website](http://marcuswest.in/essays/fun-intro/) [Source](https://github.com/marcuswestin/fun)

```
// Fun code
let user = Session.User
let myTasks = Query({ type: "task", owner: user.id })

<h1>"Hello " user.name ", these are your tasks matey:"</h1>
for (task in myTasks) {
    <div class="task" + (task.urgent ? " urgent")>
        <input data=task.title />
        if (task.completed) {
            <span class="status">"Completed!"</span>
        } else {
            <button clickHandler=markComplete(task)/>"Mark as completed"</button>
        }
    </div>
}

let markComplete = handler(task) {
    task.completed = true
}

<h3>"Create a new task"</h3>
<input data=Local.newTaskTitle />
<button clickHandler=createNewTask />

let createNewTask = handler() {
    let title = Local.newTaskTitle
    Local.newTaskTitle = ""
    Global.create({ owner: user.id, type: "task", title: title })
}
```
In Fun, when you say `"Hello " user.name`, you don't mean just "render the value of `user.name` right now". Rather, you mean "display the value of `user.name` here, and any time `user.name` changes update the UI." In other words, when someone edits their name you see the changes keystroke by keystroke. And you don't need to write any code for networking, event handling, state synchronization, or DOM manipulation! Fun takes care of all that for you, all you do is map state to UI. Fun, eh?

The realtime state synchronization works for lists as well. The statement `let myTasks = Query({ type: 'task', owner: user.id })` declares a list of all tasks that belong to the current user. The `for (task in myTasks) { ... }` loop then emits a piece of HTML for each task - if a new task gets assigned to the user then the for loops emits another piece of HTML for that task, without any effort on your part.

To bind an element that reflects a piece of state to a piece of data, all you do is set `data` attribute in the element. For example, `<input data=task.title />` will create an input field with the value of that particular task's title. If a user starts typing into the input field, then all other users viewing a piece of UI also bound to that task's title will see the updates, keystroke by keystroke.
