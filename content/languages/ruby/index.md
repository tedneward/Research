title=Ruby
tags=language, functional, dynamic, object, metaobject, web assembly, jvm, clr, native
summary=A dynamic language.
~~~~~~

### Implementations:

* [Main](https://github.com/ruby/ruby): The original Ruby implementation, written in C.

    * Can be hosted in a C application; see [Running Ruby in C](https://silverhammermba.github.io/emberb/embed/).

* [JRuby](https://www.jruby.org/) ([Source](https://github.com/jruby/jruby)): Ruby implementation written for the JVM.
* IronRuby (appears to be stalled)
* [mRuby](https://github.com/mruby/mruby): A lightweight implementation of Ruby. Has a compile-time package manager.
* [mruby/c](https://github.com/mrubyc/mrubyc): An even smaller implementation of Ruby for microcontrollers with limited memory.
* [Opal](/languages/ruby/opal): A Ruby-to-JS transpiler.
* [Sorbet](/languages/ruby/sorbet): Type-checker for Ruby.
* [Wruby](https://github.com/pannous/wruby) Web ruby - a port of minimal ruby (mruby).
* [run.rb](https://github.com/jasoncharnes/run.rb) run.rb - allows you to run Ruby code in the browser
* [Artichoke](https://github.com/artichoke/artichoke/blob/f8e9881403a50c3ba7e2b1ffc16f205c0b5e0255/VISION.md#design-and-goals) - a Ruby implementation written in Rust and Ruby. You can try it out here: https://artichoke.run
* [ruby.wasm](https://github.com/ruby/ruby.wasm/) - a collection of "official" WebAssembly ports of the CRuby. You can
  try it out [here](https://try.ruby-lang.org/playground/#code=puts+RUBY_DESCRIPTION&engine=cruby-3.2.0)
* [rlang](https://github.com/ljulliar/rlang) Rlang - a (subset of) Ruby to WebAssembly compiler
* [cry-wasm](https://github.com/kojix2/cry-wasm) - speeds up Ruby code using Crystal. By applying simple type restrictions to Ruby code, convert it to Crystal code, compile it to WebAssembly, and call it with Wasmer or Wasmtime.
* [Ruvy](https://github.com/Shopify/ruvy) - toolchain for bundling ruby.wasm pre-initialized and bundled with Ruby code
* [WebAssembly Language Runtimes](https://github.com/vmware-labs/webassembly-language-runtimes) - up-to-date MRI Ruby prebuilt for WASI


## Reading

### Books

* [A community-driven Ruby style guide](https://github.com/bbatsov/ruby-style-guide)
* [CodeCademy Ruby](https://www.codecademy.com/learn/ruby)
* [Design Patterns in Ruby](https://github.com/nslocum/design-patterns-in-ruby)
* [Developing Games With Ruby](https://leanpub.com/developing-games-with-ruby/read) - Tomas Varaneckas
* [I Love Ruby](https://i-love-ruby.gitlab.io)
* [Introduction to Programming with Ruby](https://launchschool.com/books/ruby) - Launch School
* [Just Enough Ruby to Get By](http://jasonkim.ca/projects/just_enough_ruby_to_get_by/)
* [Learn Ruby First](https://essenceofchaos.gitbooks.io/learn-ruby-first/content/) - Frederick John
* [Learn Ruby the Hard Way](https://learnrubythehardway.org/book/) - Zed A. Shaw
* [Learn to Program](http://pine.fm/LearnToProgram/) - Chris Pine
* [Mastering Roda](https://fiachetti.gitlab.io/mastering-roda) - Federico Iachetti, Avdi Grimm and Jeremy Evans
* [Mr. Neighborly's Humble Little Ruby Book](https://web.archive.org/web/20180321101922/http://www.humblelittlerubybook.com/book/html/index.html)
* [Object Oriented Programming with Ruby](https://launchschool.com/books/oo_ruby) - Launch School
* [Practicing Ruby](https://github.com/elm-city-craftworks/practicing-ruby-manuscripts)
* [Programming Ruby](http://ruby-doc.com/docs/ProgrammingRuby/)
* [Ruby Best Practices](https://github.com/practicingruby/rbp-book/tree/gh-pages/pdfs) - Gregory Brown (PDF)
* [Ruby Hacking Guide](http://ruby-hacking-guide.github.io)
* [Ruby in Twenty Minutes](https://www.ruby-lang.org/en/documentation/quickstart/)
* [Ruby Koans](http://www.rubykoans.com)
* [Ruby Learning](http://rubylearning.com)
* [Ruby Notes for Professionals](https://goalkicker.com/RubyBook/) - Compiled from StackOverflow Documentation (PDF)
* [Ruby one-liners cookbook](https://learnbyexample.github.io/learn_ruby_oneliners/) - Sundeep Agarwal
* [Ruby Style Guide](https://github.com/airbnb/ruby) - Airbnb
* [Ruby User's Guide](https://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/index.html)
* [Ruby Web Dev: The Other Way](https://leanpub.com/rwdtow/read) - Yevhen Kuzminov
* [Rubyfu](https://rubyfu.net)
* [The Bastards Book of Ruby](http://ruby.bastardsbook.com)
* [The Book Of Ruby](http://www.sapphiresteel.com/ruby-programming/The-Book-Of-Ruby.html) - Huw Collingbourne
* [The Definitive Ruby Tutorial For Complete Beginners](https://www.rubyguides.com/ruby-tutorial/) - Jesus Castello
* [The Little Book Of Ruby](http://www.sapphiresteel.com/ruby-programming/The-Little-Book-Of-Ruby.html) - Huw Collingbourne
* [The Ruby Reference](https://rubyreferences.github.io/rubyref/) - Victor Shepelev
* [The Unofficial Ruby Usage Guide (at Google)](http://www.caliban.org/ruby/rubyguide.shtml) - Ian Macdonald
* [Using Blocks in Ruby](https://web.archive.org/web/20201027171026/https://www.oreilly.com/programming/free/files/using-blocks-in-ruby.pdf) - Jay McGavren (PDF) *(:card_file_box: archived)*
* [Why's (Poignant) Guide to Ruby](http://poignant.guide)

#### RSpec

* [Better Specs (RSpec Guidelines with Ruby)](http://betterspecs.org)

#### Ruby on Rails

* [A community-driven Rails style guide](https://github.com/bbatsov/rails-style-guide)
* [Api on Rails 6](https://github.com/madeindjs/api_on_rails) - Alexandre Rousseau
* [Building REST APIs with Rails](https://www.softcover.io/read/06acc071/api_on_rails) - Abraham Kuri Vargas
* [Kestrels, Quirky Birds, and Hopeless Egocentricity](https://leanpub.com/combinators/read) - Reg Braithwaite
* [Learn Ruby on Rails as You Modify a Craigslist Clone](http://www.thinkful.com/learn/ruby-on-rails-tutorial/)
* [Learn Ruby on Rails: Book One](https://leanpub.com/learnrubyonrails) - Daniel Kehoe (PDF, EPUB) *(Leanpub account or valid email requested)*
* [Objects on Rails](https://web.archive.org/web/20190319201525/http://objectsonrails.com/) - Avdi Grimm
* [Rails Girls Guides](http://guides.railsgirls.com)
* [Ruby Notes for Professionals](https://books.goalkicker.com/RubyBook/) - Compiled from StackOverflow Documentation (PDF)
* [Ruby on Rails 3.2 - Step by Step](http://www.xyzpub.com/en/ruby-on-rails/3.2/)
* [Ruby on Rails 4.0 Guide](http://www.xyzpub.com/en/ruby-on-rails/4.0/)
* [Ruby on Rails Guides](http://guides.rubyonrails.org)
* [Ruby on Rails Notes for Professionals](https://goalkicker.com/RubyOnRailsBook/) - Compiled from StackOverflow Documentation (PDF)
* [Ruby on Rails Tutorial (Rails 5): Learn Web Development with Rails](https://www.railstutorial.org/book) - [Michael Hartl](http://www.michaelhartl.com)
* [Upgrading to Rails 4](https://github.com/alindeman/upgradingtorails4)

#### Sinatra

* [Sinatra Book](https://github.com/sinatra/sinatra-book)
