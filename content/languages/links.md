title=Links
tags=language, functional, browser
summary=A functional programming language designed to make web programming easier.
~~~~~~

[Website](https://links-lang.org/) | [Source](https://github.com/links-lang/) | [Docs](http://links-lang.org/quick-help.html)

Install: `opam install links`

## Examples
Dictionary suggestion w/database update
```
var defsTable =
  table "definitions"
  with (id:String, word:String, meaning:String)
  where id readonly from database "dictionary";

fun newDef(def) server {
  insert defsTable values (word, meaning) [def]
}

fun updateDef(def) server {
  update (d <-- defsTable)
   where (d.id == def.id)
    set (meaning=def.meaning)
}

fun deleteDef(id) server {
  delete (def <-- defsTable)
   where (def.id == id)
}

fun completions(s) server {
  if (s == "") []
  else {
    query [10] {
      for (def <-- defsTable)
       where (def.word =~ /^{s}.*/)
       orderby (def.word)
        [def]
    }
  }
}

fun redraw(xml, defId) {
  domReplaceChildren(xml, getNodeById("def:" ^^ defId))
}

mutual{
  fun editDef(def) client {
    redraw(
      <div class="edit-def">
      <form method="POST"
         l:onsubmit="{
           var def = (id=def.id, word=w, meaning=m); updateDef(def);
           redraw(formatDef(def), def.id)}">
       <table>
        <tr><td class="label-col">Entry:</td><td>
         <span class="btw">editing</span>
         <input l:name="w" value="{def.word}"/></td></tr>
        <tr><td class="label-col">Meaning:</td><td>
         <textarea l:name="m" rows="5" cols="80">{
          stringToXml(def.meaning)}</textarea></td></tr>
       </table>
       <button l:onclick="{deleteDef(def.id); redraw([], def.id)}"
        style="float:right" type="button">Delete</button>
       <button type="submit">Update</button>
       <button l:onclick="{redraw(formatDef(def), def.id)}" type="button">
        Cancel</button>
      </form>
      </div>,
      def.id)
  }

  fun formatDef(def) {
    <span l:onclick="{editDef(def)}">{stringToXml(def.meaning)}</span>
  }
}

fun format(defs) {
  <div class="section">
   <div class="tip">Click a definition to edit it.</div>
   <table>
     { for (def <- defs)
         <tr class="entry">
           <td class="label-col entry-word">{stringToXml(def.word)}</td>
           <td class="def" id="def:{def.id}">
             {formatDef(def)}
           </td>
         </tr>
     }
   </table>
  </div>
}


fun suggest(s) client {
  domReplaceChildren(format(completions(s)), getNodeById("suggestions"))
}


fun addForm(manager) {
  <form l:onsubmit="{manager!NewDef((word=w, meaning=m))}">
   <table>
    <tr><td class="label-col">Word:</td><td>
     <input type="text" l:name="w"/></td></tr>
    <tr><td>Meaning:</td><td>
     <textarea l:name="m" rows="5" cols="80"/></td></tr>
    <tr><td><button type="submit">Add</button></td></tr>
   </table>
  </form>
}

fun main() {
  var manager = spawnClient {
    fun receiver(s) {
      receive {
        case Suggest(s) -> suggest(s); receiver(s)
        case NewDef(def) ->
          newDef(def);
          domReplaceChildren(addForm(self()), getNodeById("add"));
          if (s <> "") suggest(s) else (); receiver(s)
      }
    }
    receiver("")
  };

  page
   <html>
    <head>
     <title>Dictionary suggest</title>
     <style>
       body {{ font-family: trebuchet, "trebuchet ms", helvetica,
                            arial, sans-serif; }}
       h3 {{ padding: 4px 0 4px 0; margin: 0px; }}
       td {{ vertical-align: top; }}
       td.label-col {{ text-align: right; }}
       .tip {{ margin-left: 1in; font-style: italic; }}
       .btw {{ float: right; color: #555; font-size: 10pt }}
       .entry {{ font-size: 11pt; }}
       .entry-word {{ padding-right: 6px; font-weight: bold; }}
       .def {{ color:blue }}
       .section {{ background-color: #ffffb6;
                   border: 1px solid gray;
                   padding: 12px;
                   margin-top: 4pc; }}
       .edit-def {{ border: 1px solid gray;
                    background-color: #c8c8dd;
                    padding: 4px; }}
     </style>
    </head>
    <body>
     <h1>Dictionary suggest</h1>
     <h3>Search for definitions</h3>
     <form l:onkeyup="{manager!Suggest(s)}">
      Search: <input type="text" l:name="s" autocomplete="off"/>
     </form>
     <div id="suggestions"/>
     <div class="section">
     <h3>New definition</h3>
     <div id="add">
      {addForm(manager)}
     </div>
     </div>
    </body>
   </html>
}

main()
```