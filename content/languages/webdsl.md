title=WebDSL
tags=language, browser
summary=A DSL for building Web applications.
~~~~~~

[Source](https://github.com/webdsl):
* [Compiler](https://github.com/webdsl/webdsl)
* [Editor plugin for Eclipse](https://github.com/webdsl/webdsl-editor)
* [elib-utils](https://github.com/webdsl/elib-utils): "Commonly-used functions and templates"

Example application (relies on a few other projects/libraries):
```
application elibexample

imports lib
imports ac

page root(){
  main( "Home" ){
    panel( "Demo Table" ){
      demoTable
    }
    panel( "Demo Form" ){
      demoForm
    }
  }
}

template demoTable(){
  sortedTableBordered( 100 ){
    theader{
      row{
        th{ "String value" }
        th{ "Int value" }
        th{ "WikiText value" }
      }
    }
    for( d: Demo ){
      row{
        column{ output( d.s ) }
        column{ output( d.i ) }
        column{ output( d.t ) }
      }
    }
  }
}

template demoForm(){
  var d := Demo{}
  horizontalForm( "Create entity" ){
    input( "String value", d.s )
    input( "Int value", d.i )
    input( "WikiText value", d.t )
    formActions {
      submit action{ d.save(); }{ "Save" }
    }
  }
}

entity Demo{
  s : String
  i : Int
  t : WikiText
}
```