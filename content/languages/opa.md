title=Opa
tags=language, distribution, functional
summary=An attempt at an "all-in-one" presentation, middleware, and storage system.
~~~~~~

[Website](http://opalang.org/) | [Github](https://github.com/MLstate/opalang)

Progress appears halted--no commits for several years. Wiki issue mentions that Opa is not being actively maintained.

### [Hello, chat](https://github.com/MLstate/opalang/wiki/Hello%2C-chat)
Create the application: `opa create chat`

Directory structure resulting:
```
+- chat
| +- Makefile
| +- Makefile.common
| +- opa.conf
| +- resources
| | +- css
| | | +- style.css
| +- src
| | +- model.opa
| | +- view.opa
| | +- controller.opa
```

View: building the UI:
```
module View {

  function page_template(content) {
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class=navbar-inner>
        <div class=container>
          <div id=#logo />
        </div>
      </div>
    </div>
    <div id=#main>
      {content}
    </div>
  }

  function user_update(message msg) {
    line = <div class="row-fluid line">
             <div class="span1 userpic" />
             <div class="span2 user">{msg.author}:</>
             <div class="span9 message">{msg.text}</>
           </div>;
    #conversation =+ line;
    Dom.scroll_to_bottom(#conversation);
  }

  function broadcast(author) {
    text = Dom.get_value(#entry);
    Model.broadcast(~{author, text});
    Dom.clear_value(#entry);
  }

  function chat_html(author) {
    <div id=#conversation class=container-fluid
      onready={function(_) { Model.register_message_callback(user_update)}} />
    <div id=#footer class="navbar navbar-fixed-bottom">
      <div class=container>
        <div class=input-append>
          <input id=#entry class=input-xxlarge type=text
            onnewline={function(_) { broadcast(author) }}>
          <button class="btn btn-primary" type=button
            onclick={function(_) { broadcast(author) }}>Post</>
        </div>
      </div>
    </div>
  }

  function default_page() {
    author = Model.new_author();
    Resource.page("Opa chat", page_template(chat_html(author)));
  }

}
```

Model:
```
type message = {
  string author, /** The name of the author (arbitrary string) */
  string text  /** Content entered by the user */
}

module Model {

  private Network.network(message) room = Network.cloud("room")

  exposed function broadcast(message) {
    Network.broadcast(message, room);
  }

  function register_message_callback(callback) {
    Network.add_callback(callback, room);
  }

  function new_author() {
    Random.string(8);
  }

}
```

Controller:
```
module Controller {

  // URL dispatcher of your application; add URL handling as needed
  dispatcher = {
    parser {
    case (.*) : View.default_page()
    }
  }

}

resources = @static_resource_directory("resources")

Server.start(Server.http, [
  { register:
    [ { doctype: { html5 } },
      { js: [ ] },
      { css: [ "/resources/css/style.css"] }
    ]
  },
  { ~resources },
  { custom: Controller.dispatcher }
])
```

