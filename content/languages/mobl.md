title=mobl
tags=language, presentation, android, ios
summary=A mobile application language and framework.
~~~~~~

[Website](https://www.mobl-lang.org/) | [Source](https://github.com/mobl)

Tip calculator source:
```
screen root() {
  var amount     =  20
  var percentage =  10
  header("Tip calculator")
  group {
    item { numField(amount, label="amount") }
    item { numField(percentage, label="percentage") }
    item { "$" label(amount * (1 + percentage/100)) }
  }
}
```

Academic project:

> Mobl is being developed by Zef Hemel as part of his Ph.D. thesis project part of the MoDSE project, funded by Jacquard/NWO. The research is conducted in the Software Engineering Research Group of Delft University of Technology, supervised by Eelco Visser.

Documentation is scarce/nonexistent.

Technology used:
* [Spoofax](http://strategoxt.org/Spoofax): mobl is built using the Spoofax Language Workbench.
* persistence.js: data persistence of applications is realized using the persistence.js ORM library. (Link appears to be dead)

---

### Example blog application from [Github](https://github.com/mobl/mobl-blog):
config.mobl:
```
configuration

title "Zef.me"
html index.html
offline
```

model.mobl:
```
module model

entity Post {
  entryId  : String
  title    : String
  dateStr  : String
  summary  : String
  content  : String
}
```

app.mobl:
```
application app

import mobl::ui::generic
import model
import style
import logic

var blogTitle = "Zef.me";
var blogUrl = "http://zef.me/feed";

control postItem(p : Post) {
  label(p.title)
  nl()
  span(summaryStyle) {
    label(p.summary + "...")
  }
}

control postDetail(p : Post) {
  label(p.title, style=blogHeading)
  block(blogArticleStyle) {
    html(p.content)
  }
}

screen root() {
  header(blogTitle) {
    button("Reset", onclick={
      resetDatabase();
    })
  }
  masterDetail(Post.all() order by dateStr desc, postItem, postDetail)
  script {
    async {
      fetchAndCacheFeed();
    }
  }
}
```

logic.mobl:
```
module logic

import model
import mobl::yql
import app

function updatePost(post : Post, entry : JSON) : Post {
  post.entryId = entry.id;
  post.title = entry.title;
  post.dateStr = entry.published;
  post.content = entry.content.content;
  post.summary = stripHtml(entry.content.content).substring(0, 200);
  return post;
}

function stripHtml(s : String) : String {
  return s.replace(/<[^>]*>/ig, "");
}

function fetchAndCacheFeed() {
  if(isOnline()) {
    var result = YQL.query("select * from feednormalizer where url='" + blogUrl + "' and output='atom_1.0'");
    var entries = result.feed.entry;
    foreach(entry in entries) {
      var post = Post.findBy("entryId", entry.id);
      if(!post) {
        post = Post();
        add(updatePost(post, entry));
      } else {
        updatePost(post, entry);
      }
    }
  }
}
```

style.mobl:
```
  
module style

style blogArticleStyle {
  background: white;
  margin: 0;
  padding: 10px;
}

style summaryStyle {
  color: gray;
  font-size: 70%;
}

style blogHeading {
  display: block;
  font-size: 150%;
  font-weight: bold;
}
```