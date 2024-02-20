title=StackEdit
tags=presentation, editor, browser
summary=Add StackEdit to any website.
~~~~~~

[Website](https://stackedit.io/) | [Source Website](https://benweet.github.io/stackedit.js/) | [Source](https://github.com/benweet/stackedit.js)

```
<blockquote>
    <textarea>Hello **Markdown** writer!</textarea>
</blockquote>

<script src="https://unpkg.com/stackedit-js@1.0.7/docs/lib/stackedit.min.js"></script>
<script>
// Import the lib.
const stackedit = new Stackedit();

function makeEditButton(el) {
  const div = document.createElement('div');
  div.className = 'stackedit-button-wrapper';
  div.innerHTML = '<a href="javascript:void(0)"><img src="icon.svg">Edit with StackEdit</a>';
  el.parentNode.insertBefore(div, el.nextSibling);
  return div.getElementsByTagName('a')[0];
}

const textareaEl = document.querySelector('textarea');
console.log(textareaEl)
makeEditButton(textareaEl)
  .addEventListener('click', function onClick() {
    const stackedit = new Stackedit();
    stackedit.on('fileChange', function onFileChange(file) {
      textareaEl.value = file.content.text;
    });
    stackedit.openFile({
      name: 'Markdown with StackEdit',
      content: {
        text: textareaEl.value
      }
    });
  });

const htmlEl = document.querySelector('.html');
let markdown = 'Hello **Markdown** writer!';

function doOpen(background) {
  const stackedit = new Stackedit();
  stackedit.on('fileChange', function onFileChange(file) {
    markdown = file.content.text;
    htmlEl.innerHTML = file.content.html;
  });
  stackedit.openFile({
    name: 'HTML with StackEdit',
    content: {
      text: markdown
    }
  }, background);
}

doOpen(true);
makeEditButton(htmlEl)
  .addEventListener('click', function onClick() {
    doOpen(false);
  });

</script>
```
