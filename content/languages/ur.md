title=Ur (Ur/Web)
tags=language, platform, browser, distribution
summary=A programming language in the tradition of ML and Haskell, but featuring a significantly richer type system. Ur is functional, pure, statically typed, and strict. Ur supports a powerful kind of metaprogramming based on row types.
~~~~~~

Ur is a programming language in the tradition of ML and Haskell, but featuring a significantly richer type system. Ur is functional, pure, statically typed, and strict. Ur supports a powerful kind of metaprogramming based on row types.

Ur/Web is Ur plus a special standard library and associated rules for parsing and optimization. Ur/Web supports construction of dynamic web applications backed by SQL databases. The signature of the standard library is such that well-typed Ur/Web programs "don't go wrong" in a very broad sense. Not only do they not crash during particular page generations, but they also may not:

* Suffer from any kinds of code-injection attacks
* Return invalid HTML
* Contain dead intra-application links
* Have mismatches between HTML forms and the fields expected by their handlers
* Include client-side code that makes incorrect assumptions about the "AJAX"-style services that the remote web server provides
* Attempt invalid SQL queries
* Use improper marshaling or unmarshaling in communication with SQL databases or between browsers and web servers

This type safety is just the foundation of the Ur/Web methodology. It is also possible to use metaprogramming to build significant application pieces by analysis of type structure. For instance, the demo includes an ML-style functor for building an admin interface for an arbitrary SQL table. The type system guarantees that the admin interface sub-application that comes out will always be free of the above-listed bugs, no matter which well-typed table description is given as input.

The Ur/Web compiler also produces very efficient object code that does not use garbage collection. These compiled programs will often be even more efficient than what most programmers would bother to write in C. For example, the standalone web server generated for the demo uses less RAM than the bash shell. The compiler also generates JavaScript versions of client-side code, with no need to write those parts of applications in a different language.

[Website](http://impredicative.com/ur/) | [Source](https://github.com/urweb/urweb)

Crud1 sample [application](http://impredicative.com/ur/demo/Demo/Crud1/main): crud1.urp, crud.urs, crud.ur, crud1.ur

crud1.urp
```
database dbname=test
sql crud1.sql

crud
crud1
```

crud.urs
```
con colMeta = fn (db :: Type, widget :: Type) =>
                 {Nam : string,
                  Show : db -> xbody,
                  Widget : nm :: Name -> xml form [] [nm = widget],
                  WidgetPopulated : nm :: Name -> db -> xml form [] [nm = widget],
                  Parse : widget -> db,
                  Inject : sql_injectable db}
con colsMeta = fn cols :: {(Type * Type)} => $(map colMeta cols)

val int : string -> colMeta (int, string)
val float : string -> colMeta (float, string)
val string : string -> colMeta (string, string)
val bool : string -> colMeta (bool, bool)

functor Make(M : sig
                 con cols :: {(Type * Type)}
                 constraint [Id] ~ cols
                 val fl : folder cols

                 table tab : ([Id = int] ++ map fst cols)

                 val title : string

                 val cols : colsMeta cols
             end) : sig
    val main : unit -> transaction page
end
```

crud.ur
```
con colMeta = fn (db :: Type, widget :: Type) =>
                 {Nam : string,
                  Show : db -> xbody,
                  Widget : nm :: Name -> xml form [] [nm = widget],
                  WidgetPopulated : nm :: Name -> db -> xml form [] [nm = widget],
                  Parse : widget -> db,
                  Inject : sql_injectable db}
con colsMeta = fn cols => $(map colMeta cols)

fun default [t] (sh : show t) (rd : read t) (inj : sql_injectable t)
            name : colMeta (t, string) =
    {Nam = name,
     Show = txt,
     Widget = fn [nm :: Name] => <xml><textbox{nm}/></xml>,
     WidgetPopulated = fn [nm :: Name] n =>
                          <xml><textbox{nm} value={show n}/></xml>,
     Parse = readError,
     Inject = _}

val int = default
val float = default
val string = default

fun bool name = {Nam = name,
                 Show = txt,
                 Widget = fn [nm :: Name] => <xml><checkbox{nm}/></xml>,
                 WidgetPopulated = fn [nm :: Name] b =>
                                      <xml><checkbox{nm} checked={b}/></xml>,
                 Parse = fn x => x,
                 Inject = _}

functor Make(M : sig
                 con cols :: {(Type * Type)}
                 constraint [Id] ~ cols
                 val fl : folder cols

                 table tab : ([Id = int] ++ map fst cols)

                 val title : string

                 val cols : colsMeta cols
             end) = struct

    val tab = M.tab

    sequence seq

    fun list () =
        rows <- queryX (SELECT * FROM tab AS T)
                       (fn (fs : {T : $([Id = int] ++ map fst M.cols)}) => <xml>
                         <tr>
                           <td>{[fs.T.Id]}</td>
                           {@mapX2 [fst] [colMeta] [tr]
                             (fn [nm :: Name] [t ::_] [rest ::_] [[nm] ~ rest] v col => <xml>
                               <td>{col.Show v}</td>
                             </xml>)
                             M.fl (fs.T -- #Id) M.cols}
                           <td>
                             <a link={upd fs.T.Id}>[Update]</a>
                             <a link={confirm fs.T.Id}>[Delete]</a>
                           </td>
                         </tr>
                       </xml>);
        return <xml>
          <table border={1}>
            <tr>
              <th>ID</th>
              {@mapX [colMeta] [tr]
                (fn [nm :: Name] [t ::_] [rest ::_] [[nm] ~ rest] col => <xml>
                  <th>{cdata col.Nam}</th>
                </xml>)
                M.fl M.cols}
            </tr>
            {rows}
          </table>

          <br/><hr/><br/>

          <form>
            {@foldR [colMeta] [fn cols => xml form [] (map snd cols)]
              (fn [nm :: Name] [t ::_] [rest ::_] [[nm] ~ rest] (col : colMeta t) acc => <xml>
                <li> {cdata col.Nam}: {col.Widget [nm]}</li>
                {useMore acc}
              </xml>)
              <xml/>
              M.fl M.cols}
            
            <submit action={create}/>
          </form>
        </xml>

    and create (inputs : $(map snd M.cols)) =
        id <- nextval seq;
        dml (insert tab
                    (@foldR2 [snd] [colMeta]
                      [fn cols => $(map (fn t => sql_exp [] [] [] t.1) cols)]
                      (fn [nm :: Name] [t ::_] [rest ::_] [[nm] ~ rest] =>
                       fn input col acc => acc ++ {nm = @sql_inject col.Inject (col.Parse input)})
                      {} M.fl inputs M.cols
                     ++ {Id = (SQL {[id]})}));
        ls <- list ();
        return <xml><body>
          <p>Inserted with ID {[id]}.</p>

          {ls}
        </body></xml>

    and upd (id : int) =
        let
            fun save (inputs : $(map snd M.cols)) =
                dml (update [map fst M.cols]
                            (@foldR2 [snd] [colMeta]
                              [fn cols => $(map (fn t => sql_exp [T = [Id = int] ++ map fst M.cols] [] [] t.1) cols)]
                              (fn [nm :: Name] [t ::_] [rest ::_] [[nm] ~ rest] =>
                               fn input col acc => acc ++ {nm =
                                                           @sql_inject col.Inject (col.Parse input)})
                              {} M.fl inputs M.cols)
                            tab (WHERE T.Id = {[id]}));
                ls <- list ();
                return <xml><body>
                  <p>Saved!</p>

                  {ls}
                </body></xml>
        in
            fso <- oneOrNoRows (SELECT tab.{{map fst M.cols}} FROM tab WHERE tab.Id = {[id]});
            case fso : (Basis.option {Tab : $(map fst M.cols)}) of
                None => return <xml><body>Not found!</body></xml>
              | Some fs => return <xml><body><form>
                {@foldR2 [fst] [colMeta] [fn cols => xml form [] (map snd cols)]
                  (fn [nm :: Name] [t ::_] [rest ::_] [[nm] ~ rest] v (col : colMeta t)
                                   (acc : xml form [] (map snd rest)) =>
                      <xml>
                        <li> {cdata col.Nam}: {col.WidgetPopulated [nm] v}</li>
                        {useMore acc}
                      </xml>)
                  <xml/>
                  M.fl fs.Tab M.cols}

                <submit action={save}/>
              </form></body></xml>
        end

    and confirm (id : int) =
        let
            fun delete () =
                dml (DELETE FROM tab WHERE Id = {[id]});
                ls <- list ();
                return <xml><body>
                  <p>The deed is done.</p>
                  
                  {ls}
                </body></xml>
        in
            return <xml><body>
              <p>Are you sure you want to delete ID #{[id]}?</p>
              
              <form><submit action={delete} value="I was born sure!"/></form>
            </body></xml>
        end

    and main () =
        ls <- list ();
        return <xml><head>
          <title>{cdata M.title}</title>
        </head><body>

          <h1>{cdata M.title}</h1>

          {ls}
        </body></xml>

end
```

crud1.ur
```
table t1 : {Id : int, A : int, B : string, C : float, D : bool}
  PRIMARY KEY Id

open Crud.Make(struct
                   val tab = t1
                             
                   val title = "Crud1"
                               
                   val cols = {A = Crud.int "A",
                               B = Crud.string "B",
                               C = Crud.float "C",
                               D = Crud.bool "D"}
               end)
```
https://github.com/urweb/urweb
Ur is a programming language in the tradition of ML and Haskell, but featuring a significantly richer type system. Ur is functional, pure, statically typed, and strict. Ur supports a powerful kind of metaprogramming based on row types.
