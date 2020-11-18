title=Lux
tags=language, jvm, nodejs, functional, static
summary=Meant to be a functional, statically-typed Lisp that will run on several platforms, such as the Java Virtual Machine and JavaScript interpreters.
~~~~~~

[Source](https://github.com/LuxLang/lux)

### Example
```
(;module:
  lux
  (lux (control monad
                eq)
       (data (struct [list #* "" Functor<List> Fold<List>])
             [text "Text/" Eq<Text>]
             [number "Int/" Codec<Text,Int>]
             ["E" error #*]
             [product]
             text/format)
       [compiler]
       (macro ["s" syntax #+ Syntax syntax:])
       (codata [io #- run])
       host
       (concurrency [promise #+ Promise Monad<Promise>])
       [cli #+ program:])
  (. ["&&" core]
     ["&&;" state]
     ["&&;" util]
     ["&&;" ui]
     (server ["&&server" core]
             ["&&server-host" host])
     ))

(syntax: (?? default input)
  {#;doc "A simple macro for providing default values to Error-producing expressions."}
  (do @
    [g!_ (compiler;gensym "")
     g!output (compiler;gensym "")]
    (wrap (list (` (case (~ input)
                     (#E;Error (~ g!_))
                     (~ default)

                     (#E;Success (~ g!output))
                     (~ g!output)
                     ))
                ))
    ))

## [Program]
(def: (handler state req)
  (-> &&state;App-State &&server;Request-Handler)
  (let [(^slots [#&&server;request-method
                 #&&server;request-uri
                 #&&server;request-headers
                 #&&server;request-params
                 #&&server;request-body]) req]
    (if (Text/= &&util;css-path request-uri)
      ## Serve CSS style-sheet if route matches.
      (:: Monad<Promise> wrap (&&server;css-response &&ui;css))
      ## Otherwise, some functionality is required.
      (do Monad<Promise>
        [#let [## When visiting some URL, I need to figure out from
               ## where did the user come from, because to add a task
               ## to the TODO list, you must POST it to your current
               ## route (whatever it may be).
               referer (?? &&util;default-referer
                           (&&server;get-header "Referer" request-headers))
               same-url? (Text/= (format &&util;default-host request-uri) referer)]
         succeded? (?? (wrap false)
                       (case request-uri
                         (^~ &&util;toggle-path)
                         (do Monad<Error>
                           [id' (&&server;get-param "id" request-params)
                            id (Int/decode id')]
                           (wrap (promise;future (&&state;toggle-task (int-to-nat id) state))))
                         
                         (^~ &&util;delete-path)
                         (do Monad<Error>
                           [id' (&&server;get-param "id" request-params)
                            id (Int/decode id')]
                           (wrap (promise;future (&&state;delete-task (int-to-nat id) state))))

                         (^~ &&util;clear-completed-path)
                         (do Monad<Error>
                           []
                           (wrap (promise;future (&&state;clear-completed state))))
                         
                         _ ## else
                         (do Monad<Error>
                           [task-desc (&&server;get-param "todo" request-params)]
                           (if (Text/= "" task-desc)
                             ## Don't add empty tasks.
                             (wrap (:: Monad<Promise> wrap true))
                             (wrap (if same-url?
                                     (promise;future (&&state;add-task task-desc state))
                                     (:: Monad<Promise> wrap true))))
                           )))
         show-clear-completed? (promise;future (&&ui;show-clear-completed? state))
         ## Get all the currently-available tasks.
         tasks (promise;future (&&state;get-task-list state))
         #let [num-tasks-left (|> tasks
                                  (filter (. &&state;active-task? product;right))
                                  size)
               ## Figure out the filter from the URL.
               display-filter (case request-uri
                                (^~ &&util;all-path)       #&&ui;All
                                (^~ &&util;active-path)    #&&ui;Active
                                (^~ &&util;completed-path) #&&ui;Completed
                                _                          #&&ui;All)
               ## Figure out which tasks to render.
               tasks-to-show (&&ui;filter-tasks display-filter tasks)
               ## The rendered tasks page.
               output-page (&&ui;page$ (&&ui;todo$ show-clear-completed? num-tasks-left display-filter tasks-to-show))]]
        (wrap (if (and succeded?
                       (not same-url?))
                (&&server;redirect referer)
                (&&server;html-response output-page)))))
    ))

(program: args
  (do Monad<IO>
    [## Initialize app-state.
     app-state &&state;gen-state
     ## Deploy Vert.x server.
     _ (&&server-host;deploy-server &&util;server-port (handler app-state))]
    (wrap (log! "Server is running!"))))
```
