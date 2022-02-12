title=Android Jetpack Compose
tags=platform, android, presentation
summary=The functional-composition way to build UIs in Android; "Jetpack Compose is Android’s modern toolkit for building native UI. It simplifies and accelerates UI development on Android".
~~~~~~

[Guide](https://developer.android.com/jetpack/compose):

* [State](https://developer.android.com/jetpack/compose/state): Compose is declarative and as such the only way to update it is by calling the same composable with new arguments. These arguments are representations of the UI state. Any time a state is updated a recomposition takes place. As a result, things like TextField don’t automatically update like they do in imperative XML based views. A composable has to explicitly be told the new state in order for it to update accordingly.

        ```
        @Composable
        fun HelloContent() {
            Column(modifier = Modifier.padding(16.dp)) {
                Text(
                    text = "Hello!",
                    modifier = Modifier.padding(bottom = 8.dp),
                    style = MaterialTheme.typography.h5
                )
                OutlinedTextField(
                    value = "",
                    onValueChange = { },
                    label = { Text("Name") }
                )
            }
        }
        ```

    If you run this, you'll see that nothing happens. That's because the TextField doesn't update itself—it updates when its value parameter changes. This is due to how composition and recomposition work in Compose.

    Composable functions can store a single object in memory by using the remember composable. A value computed by remember is stored in the Composition during initial composition, and the stored value is returned during recomposition. remember can be used to store both mutable and immutable objects. `mutableStateOf` creates an observable `MutableState<T>`, which is an observable type integrated with the compose runtime.

    Any changes to `value` will schedule recomposition of any composable functions that read value. In the case of ExpandingCard, whenever `expanded` changes, it causes ExpandingCard to be recomposed.

    There are three ways to declare a MutableState object in a composable:

        ```
        val mutableState = remember { mutableStateOf(default) }
        var value by remember { mutableStateOf(default) }
        val (value, setValue) = remember { mutableStateOf(default) }
        ```

    These declarations are equivalent, and are provided as syntax sugar for different uses of state. You should pick the one that produces the easiest-to-read code in the composable you're writing.

    You can use the remembered value as a parameter for other composables or even as logic in statements to change which composables are displayed. For example, if you don't want to display the greeting if the name is empty, use the state in an if statement:

        ```
        @Composable
        fun HelloContent() {
            Column(modifier = Modifier.padding(16.dp)) {
                var name by remember { mutableStateOf("") }
                if (name.isNotEmpty()) {
                    Text(
                        text = "Hello, $name!",
                        modifier = Modifier.padding(bottom = 8.dp),
                        style = MaterialTheme.typography.h5
                    )
                }
                OutlinedTextField(
                    value = name,
                    onValueChange = { name = it },
                    label = { Text("Name") }
                )
            }
        }
        ```

    While remember helps you retain state across recompositions, the state is not retained across configuration changes. For this, you must use rememberSaveable. rememberSaveable automatically saves any value that can be saved in a Bundle. For other values, you can pass in a custom saver object.

    **State vs stateless.** A composable that uses remember to store an object creates internal state, making the composable stateful. HelloContent is an example of a stateful composable because it holds and modifies its name state internally. This can be useful in situations where a caller doesn't need to control the state and can use it without having to manage the state themselves. However, composables with internal state tend to be less reusable and harder to test. A stateless composable is a composable that doesn't hold any state. An easy way to achieve stateless is by using "state hoisting". As you develop reusable composables, you often want to expose both a stateful and a stateless version of the same composable. The stateful version is convenient for callers that don't care about the state, and the stateless version is necessary for callers that need to control or hoist the state.

    **State hoisting.** State hoisting in Compose is a pattern of moving state to a composable's caller to make a composable stateless. State that is hoisted this way has some important properties:

    * Single source of truth: By moving state instead of duplicating it, we're ensuring there's only one source of truth. This helps avoid bugs.
    * Encapsulated: Only stateful composables will be able to modify their state. It's completely internal.
    * Shareable: Hoisted state can be shared with multiple composables. Say we wanted to name in a different composable, hoisting would allow us to do that.
    * Interceptable: callers to the stateless composables can decide to ignore or modify events before changing the state.
    * Decoupled: the state for the stateless ExpandingCard may be stored anywhere. For example, it's now possible to move name into a ViewModel.
    
    The general pattern for state hoisting in Jetpack Compose is to replace the state variable with two parameters:

    * `value: T`: the current value to display
    * `onValueChange: (T) -> Unit`: an event that requests the value to change, where T is the proposed new value

    However, you are not limited to onValueChange. If more specific events are appropriate for the composable you should define them using lambdas like ExpandingCard does with onExpand and onCollapse.    

    In the example case, you extract the name and the onValueChange out of HelloContent and move them up the tree to a HelloScreen composable that calls HelloContent.

        ```
        @Composable
        fun HelloScreen() {
            var name by rememberSaveable { mutableStateOf("") }

            HelloContent(name = name, onNameChange = { name = it })
        }

        @Composable
        fun HelloContent(name: String, onNameChange: (String) -> Unit) {
            Column(modifier = Modifier.padding(16.dp)) {
                Text(
                    text = "Hello, $name",
                    modifier = Modifier.padding(bottom = 8.dp),
                    style = MaterialTheme.typography.h5
                )
                OutlinedTextField(
                    value = name,
                    onValueChange = onNameChange,
                    label = { Text("Name") }
                )
            }
        }
        ```

    

## Articles

## Blog posts



---

[Tutorial](https://developer.android.com/jetpack/compose/tutorial):

* **Lesson 1: Hello World** Create an app using the Empty Compose Activity template. Create an app using the Empty Compose Activity template. Display a “Hello world!” text by adding a text element inside the onCreate method. You do this by defining a content block, and calling the Text() function. The setContent block defines the activity's layout where we call composable functions. Composable functions can only be called from other composable functions. (Jetpack Compose uses a Kotlin compiler plugin to transform these composable functions into the app's UI elements. For example, the Text() function that is defined by the Compose UI library displays a text label on the screen.)

    To make a function composable, add the @Composable annotation. To try this out, define a MessageCard() function which is passed a name, and uses it to configure the text element.

    The composable function must provide default values for any parameters. For this reason, you can't preview the MessageCard() function directly. Instead, let’s make a second function named PreviewMessageCard(), which calls MessageCard() with an appropriate parameter. Add the @Preview annotation before @Composable.

* **Lesson 2: Layouts**  UI elements are hierarchical, with elements contained in other elements. In Compose, you build a UI hierarchy by calling composable functions from other composable functions. We’re going to build a simple messaging screen containing a list of messages that can be expanded with some animations. Let’s start by making our message composable richer by displaying the name of its author and a message content. We need first to change our composable parameter to accept a Message object instead of a String, and add another Text composable inside the MessageCard composable.

        ```
        class MainActivity : ComponentActivity() {
            override fun onCreate(savedInstanceState: Bundle?) {
                super.onCreate(savedInstanceState)
                setContent {
                    MessageCard(Message("Android", "Jetpack Compose"))
                }
            }
        }

        data class Message(val author: String, val body: String)

        @Composable
        fun MessageCard(msg: Message) {
            Text(text = msg.author)
            Text(text = msg.body)
        }

        @Preview
        @Composable
        fun PreviewMessageCard() {
            MessageCard(
                msg = Message("Colleague", "Hey, take a look at Jetpack Compose, it's great!")
            )
        }
        ```

    This code creates two text elements inside the content view. However, since we haven't provided any information about how to arrange them, the text elements are drawn on top of each other, making the text unreadable. The Column function lets you arrange elements vertically. Add Column to the MessageCard() function. You can use Row to arrange items horizontally and Box to stack elements.

    Add an image element: Add a profile picture of the sender. Use the Resource Manager to import an image from your photo library or use this one. Add a Row composable to have a well structured design and an Image composable inside it:
    
        ```
        @Composable
        fun MessageCard(msg: Message) {
            Row {
                Image(
                    painter = painterResource(R.drawable.profile_picture),
                    contentDescription = "Contact profile picture",
                )
            Column {
                    Text(text = msg.author)
                    Text(text = msg.body)
                }
            } 
        }
        ```

        Our message layout has the right structure but its elements aren't well spaced and the image is too big! To decorate or configure a composable, Compose uses modifiers. They allow you to change the composable's size, layout, appearance or add high-level interactions, such as making an element clickable. You can chain them to create richer composables. Let's use some of them to improve the layout:

        ```
        @Composable
        fun MessageCard(msg: Message) {
            // Add padding around our message
            Row(modifier = Modifier.padding(all = 8.dp)) {
                Image(
                    painter = painterResource(R.drawable.profile_picture),
                    contentDescription = "Contact profile picture",
                    modifier = Modifier
                        // Set image size to 40 dp
                        .size(40.dp)
                        // Clip image to be shaped as a circle
                        .clip(CircleShape)
                )

                // Add a horizontal space between the image and the column
                Spacer(modifier = Modifier.width(8.dp))

                Column {
                    Text(text = msg.author)
                    // Add a vertical space between the author and message texts
                    Spacer(modifier = Modifier.height(4.dp))
                    Text(text = msg.body)
                }
            }
        }
        ```

* **Lesson 3: Material Design** Compose is built to support Material Design principles. Many of its UI elements implement Material Design out of the box. To start, we wrap our MessageCard function with the Material theme created in your project *(you can find your custom theme in the ui.theme package)*, ComposeTutorialTheme in this case. Do it both in the @Preview and in the setContent function.

        ```
        class MainActivity : ComponentActivity() {
            override fun onCreate(savedInstanceState: Bundle?) {
                super.onCreate(savedInstanceState)
                setContent {
                    ComposeTutorialTheme {
                        MessageCard(Message("Android", "Jetpack Compose"))
                    }
                }
            }
        }

        @Preview
        @Composable
        fun PreviewMessageCard() {
            ComposeTutorialTheme {
                MessageCard(
                    msg = Message("Colleague", "Take a look at Jetpack Compose, it's great!")
                )
            }
        }
        ```

    Material Design is built around three pillars: Color, Typography, Shape.

    **Color**: Let's style the title and add a border to the image:

        ```
        @Composable
        fun MessageCard(msg: Message) {
            Row(modifier = Modifier.padding(all = 8.dp)) {
                Image(
                    painter = painterResource(R.drawable.profile_picture),
                    contentDescription = null,
                    modifier = Modifier
                        .size(40.dp)
                        .clip(CircleShape)
                        .border(1.5.dp, MaterialTheme.colors.secondary, CircleShape)
                )
                Spacer(modifier = Modifier.width(8.dp))

                Column {
                    Text(
                        text = msg.author,
                        color = MaterialTheme.colors.secondaryVariant,
                        style = MaterialTheme.typography.subtitle2
                    )

                    Spacer(modifier = Modifier.height(4.dp))

                    Text(
                        text = msg.body,
                        style = MaterialTheme.typography.body2
                    )
                }
            }
        }
        ```

    **Typography**: Material Typography styles are available in the MaterialTheme, just add them to the Text composables.

        ```
        @Composable
        fun MessageCard(msg: Message) {
            Row(modifier = Modifier.padding(all = 8.dp)) {
                Image(
                    painter = painterResource(R.drawable.profile_picture),
                    contentDescription = null,
                    modifier = Modifier
                        .size(40.dp)
                        .clip(CircleShape)
                        .border(1.5.dp, MaterialTheme.colors.secondary, CircleShape)
                )
                Spacer(modifier = Modifier.width(8.dp))

                Column {
                    Text(
                        text = msg.author,
                        color = MaterialTheme.colors.secondaryVariant,
                        style = MaterialTheme.typography.subtitle2
                    )

                    Spacer(modifier = Modifier.height(4.dp))

                    Text(
                        text = msg.body,
                        style = MaterialTheme.typography.body2
                    )
                }
            }
        }        
        ```
    
    **Shape**: 

        ```
        @Composable
        fun MessageCard(msg: Message) {
            Row(modifier = Modifier.padding(all = 8.dp)) {
                Image(
                    painter = painterResource(R.drawable.profile_picture),
                    contentDescription = null,
                    modifier = Modifier
                        .size(40.dp)
                        .clip(CircleShape)
                        .border(1.5.dp, MaterialTheme.colors.secondary, CircleShape)
                )
                Spacer(modifier = Modifier.width(8.dp))

                Column {
                    Text(
                        text = msg.author,
                        color = MaterialTheme.colors.secondaryVariant,
                        style = MaterialTheme.typography.subtitle2
                    )

                    Spacer(modifier = Modifier.height(4.dp))

                    Surface(shape = MaterialTheme.shapes.medium, elevation = 1.dp) {
                        Text(
                            text = msg.body,
                            modifier = Modifier.padding(all = 4.dp),
                            style = MaterialTheme.typography.body2
                        )
                    }
                }
            }
        }
        ```
    
* **Lesson 4: Lists and Animations** Lists and animations are everywhere in apps. Create a Conversation function that will show multiple messages. For this use case, we can use Compose’s LazyColumn and LazyRow. These composables render only the elements that are visible on screen, so they are designed to be very efficient for long lists. At the same time, they avoid the complexity of RecyclerView with XML layouts. 

        ```
        @Composable
        fun Conversation(messages: List<Message>) {
            LazyColumn {
                items(messages) { message ->
                    MessageCard(message)
                }
            }
        }

        @Preview
        @Composable
        fun PreviewConversation() {
            ComposeTutorialTheme {
                Conversation(SampleData.conversationSample)
            }
        }
        ```

    In this code snippet, you can see that LazyColumn has an items child. It takes a List as a parameter and its lambda receives a parameter we’ve named message (we could have named it whatever we want) which is an instance of Message. In short, this lambda is called for each item of the provided List. Import this sample dataset into your project to help bootstrap the conversation quickly.

        ```
        class MainActivity : ComponentActivity() {
            override fun onCreate(savedInstanceState: Bundle?) {
                super.onCreate(savedInstanceState)
                setContent {
                    ComposeTutorialTheme {
                        Conversation(SampleData.conversationSample)
                    }
                }
            }
        }

        @Composable
        fun MessageCard(msg: Message) {
            Row(modifier = Modifier.padding(all = 8.dp)) {
                Image(
                    painter = painterResource(R.drawable.profile_picture),
                    contentDescription = null,
                    modifier = Modifier
                        .size(40.dp)
                        .clip(CircleShape)
                        .border(1.5.dp, MaterialTheme.colors.secondaryVariant, CircleShape)
                )
                Spacer(modifier = Modifier.width(8.dp))

                // We keep track if the message is expanded or not in this
                // variable
                var isExpanded by remember { mutableStateOf(false) }

                // We toggle the isExpanded variable when we click on this Column
                Column(modifier = Modifier.clickable { isExpanded = !isExpanded }) {
                    Text(
                        text = msg.author,
                        color = MaterialTheme.colors.secondaryVariant,
                        style = MaterialTheme.typography.subtitle2
                    )

                    Spacer(modifier = Modifier.height(4.dp))

                    Surface(
                        shape = MaterialTheme.shapes.medium,
                        elevation = 1.dp,
                    ) {
                        Text(
                            text = msg.body,
                            modifier = Modifier.padding(all = 4.dp),
                            // If the message is expanded, we display all its content
                            // otherwise we only display the first line
                            maxLines = if (isExpanded) Int.MAX_VALUE else 1,
                            style = MaterialTheme.typography.body2
                        )
                    }
                }
            }
        }
        ```

    add the ability to expand a message to show a longer one, animating both the content size and the background color. To store this local UI state, we need to keep track of whether a message has been expanded or not. To keep track of this state change, we have to use the functions remember and mutableStateOf. Composable functions can store local state in memory by using remember, and track changes to the value passed to mutableStateOf. Composables (and their children) using this state will get redrawn automatically when the value is updated. We call this recomposition. By using Compose’s state APIs like remember and mutableStateOf, any changes to state automatically update the UI.

    Now we can change the background of the message content based on isExpanded when we click on a message. We will use the clickable modifier to handle click events on the composable. Instead of just toggling the background color of the Surface, we will animate the background color by gradually modifying its value from MaterialTheme.colors.surface to MaterialTheme.colors.primary and vice versa. To do so, we will use the animateColorAsState function. Lastly, we will use the animateContentSize modifier to animate the message container size smoothly:

        ```
        @Composable
        fun MessageCard(msg: Message) {
            Row(modifier = Modifier.padding(all = 8.dp)) {
                Image(
                    painter = painterResource(R.drawable.profile_picture),
                    contentDescription = null,
                    modifier = Modifier
                        .size(40.dp)
                        .clip(CircleShape)
                        .border(1.5.dp, MaterialTheme.colors.secondaryVariant, CircleShape)
                )
                Spacer(modifier = Modifier.width(8.dp))

                // We keep track if the message is expanded or not in this
                // variable
                var isExpanded by remember { mutableStateOf(false) }
                // surfaceColor will be updated gradually from one color to the other
                val surfaceColor: Color by animateColorAsState(
                    if (isExpanded) MaterialTheme.colors.primary else MaterialTheme.colors.surface,
                )

                // We toggle the isExpanded variable when we click on this Column
                Column(modifier = Modifier.clickable { isExpanded = !isExpanded }) {
                    Text(
                        text = msg.author,
                        color = MaterialTheme.colors.secondaryVariant,
                        style = MaterialTheme.typography.subtitle2
                    )

                    Spacer(modifier = Modifier.height(4.dp))

                    Surface(
                        shape = MaterialTheme.shapes.medium,
                        elevation = 1.dp,
                        // surfaceColor color will be changing gradually from primary to surface
                        color = surfaceColor,
                        // animateContentSize will change the Surface size gradually
                        modifier = Modifier.animateContentSize().padding(1.dp)
                    ) {
                        Text(
                            text = msg.body,
                            modifier = Modifier.padding(all = 4.dp),
                            // If the message is expanded, we display all its content
                            // otherwise we only display the first line
                            maxLines = if (isExpanded) Int.MAX_VALUE else 1,
                            style = MaterialTheme.typography.body2
                        )
                    }
                }
            }
        }
        ```

