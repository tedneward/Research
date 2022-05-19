title=CSS snippets
tags=presentation, browser
summary=Cool CSS snippets I find along the way.
~~~~~~

[CSS for an "index card" effect](https://codepen.io/jenanemone/pen/MWQbPeR):
```html
<div class="card-title">
      Milkshake
    </div>
  <div class="card">
    
    <span class="card-text">
      <ul>
        <li>1c 2% milk</li>
        <li>1/8c cream</li>
        <li>1c ice cream</li>
      </ul>
      <p>Blend well, top with whipped cream or crushed candy, and serve cold.</p>
    </span>
  </div>
```

```css
/* Styling specific to an index card */
.card {
  background-color: white;
  background: repeating-linear-gradient(rgb(240,250,250), rgb(240,250,250) 25px, #9198e5 26px, #9198e5 27px);
  height: 300px;
  width: 500px;
  padding: 0;
}
.card-title {
  background-image: linear-gradient(rgb(240,250,250), rgb(240,250,250) 42px, pink 43px, pink 44px, rgb(240,250,250) 46px);
  height: 46px;
  width: 500px;
  padding-left: 25px;
  padding-top: 3px;
  color: black;
  line-height: 46px;
  font-size: 30px;
  font-weight: bold;
}
.card-text {
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  font-size: 18px;
  line-height: 27px;
  padding-top: 4px;
}
p {
  padding-left: 25px;
}
```

---

[CSS Tips](https://markodenic.com/css-tips/):

* Typing Effect:
    HTML:
    ```
    <div class="wrapper">
      <div class="typing-demo">
        This is a typing demo.
      </div>
    </div>
    ```
    CSS:
    ```
    .wrapper {
      height: 100vh;
      /*This part is important for centering*/
      display: grid;
      place-items: center;
    }

    .typing-demo {
      width: 22ch;
      animation: typing 2s steps(22), blink .5s step-end infinite alternate;
      white-space: nowrap;
      overflow: hidden;
      border-right: 3px solid;
      font-family: monospace;
      font-size: 2em;
    }

    @keyframes typing {
      from {
        width: 0
      }
    }
        
    @keyframes blink {
      50% {
        border-color: transparent
      }
    }
    ```

* Drop shadow: When you work with transparent images you can use `drop-shadow()` filter function to create a shadow on the image’s content, instead of `box-shadow` property which creates a rectangular shadow behind an element’s entire box: filter: `drop-shadow(2px 4px 8px #585858)`
    HTML
    ```
    <div class="wrapper">
      <div class="mr-2">
        <div class="mb-1 text-center">
          box-shadow
        </div>
        
        <img class="box-shadow" src="https://markodenic.com/man_working.png" alt="Image with box-shadow">
      </div>
        
      <div>
        <div class="mb-1 text-center">
          drop-shadow
        </div>
        
        <img class="drop-shadow" src="https://markodenic.com/man_working.png" alt="Image with drop-shadow">
      </div>
    </div>
    ```
    CSS:
    ```
    .wrapper {
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .mr-2 {
      margin-right: 2em;
    }

    .mb-1 {
      margin-bottom: 1em;
    }

    .text-center {
      text-align: center;
    }

    .box-shadow {
      box-shadow: 2px 4px 8px #585858;
    }

    .drop-shadow {
      filter: drop-shadow(2px 4px 8px #585858);
    }
    ```

* Smooth scrolling:
    HTML:
    ```
    <nav>
      Scroll to: 
      <a href="#sectionA" class="link bg-red">A</a>
      
      <a href="#sectionB" class="link bg-blue">B</a>
      
      <a href="#sectionC" class="link bg-green">C</a>
    </nav>

    <div class="wrapper">
      <div id="sectionA" class="section bg-red">A</div>
      
      <div id="sectionB" class="section bg-blue">B</div>
      
      <div id="sectionC" class="section bg-green">C</div>
    </div>
    ```
    CSS:
    ```
    html {
      scroll-behavior: smooth;
    }

    nav {
      position: fixed;
      left: calc(50vw - 115px);
      top: 0;
      width: 200px;
      text-align: center;
      padding: 15px;
      background: #fff;
      box-shadow: 0 2px 5px 1px rgba(0, 0, 0, 0.2);
    }

    nav .link {
      padding: 5px;
      color: white;
    }

    .section {
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      color: #fff;
      font-size: 5em;
      text-shadow:
        0px 2px 0px #b2a98f,
        0px 4px 3px rgba(0,0,0,0.15),
        0px 8px 1px rgba(0,0,0,0.1);
    }

    .bg-red {
      background: #de5448;
    }

    .bg-blue {
      background: #4267b2;
    }

    .bg-green {
      background: #4CAF50;
    }
    ```
* Center: Easily center anything, horizontally and vertically, with 3 lines of CSS.
    CSS:
    ```
    .center {
      display: flex;
      align-items: center;
      justify-content: center;       
    }           
    ```
* Cursors (as in, mouse cursor):
    HTML:
    ```
    <div class="wrapper">
      <div class="tile">
        Default
      </div>
      
      <div class="tile tile--image-cursor">
        Image Cursor
      </div>
      
      <div class="tile tile--emoji-cursor">
        Emoji Cursor
      </div>
    </div>
    ```
    CSS:
    ```
    .wrapper {
      display: flex;
      height: 100vh;
      align-items: center;
      justify-content: center;
      background: #4776e6;
      background: -webkit-linear-gradient(to right, #4776e6, #8e54e9);
      background: linear-gradient(to right, #4776e6, #8e54e9);
      padding: 0 10px;
    }

    .tile {
        width: 200px;
        height: 200px;display: flex;
        align-items: center;
        justify-content: center;
        background-color: #de5448;
        margin-right: 10px;color: #fff;
        font-size: 1.4em;
        text-align: center;
      }

    .tile--image-cursor {
      background-color: #1da1f2;
      cursor: url(https://picsum.photos/20/20), auto;
    }

    .tile--emoji-cursor {
      background-color: #4267b2;
      cursor: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg'  width='40' height='48' viewport='0 0 100 100' style='fill:black;font-size:24px;'><text y='50%'>🚀</text></svg>"), auto;
    }
    ```
* Truncate text
* Truncate the text to a specific number of lines
* `::selection` CSS pseudo-element
* Anything resizable: Did you know that you can make any element resizable, just like `<textarea>`?
* CSS modals: You can use the `:target` pseudo-class to create modals with zero JavaScript.
    HTML:
    ```
    <div class="wrapper">
        <a href="#demo-modal">Open Demo Modal</a>
    </div>

    <div id="demo-modal" class="modal">
        <div class="modal__content">
            <h1>CSS Only Modal</h1>

            <p>
                You can use the :target pseudo-class to create a modals with Zero JavaScript. Enjoy!
            </p>

            <div class="modal__footer">
                Made with <i class="fa fa-heart"></i>, by <a href="https://twitter.com/denicmarko" target="_blank">@denicmarko</a>
            </div>

            <a href="#" class="modal__close">&times;</a>
        </div>
    </div>    
    ```
    CSS:
    ```
    .wrapper {
      height: 100vh;
      /* This part is important for centering the content */
      display: flex;
      align-items: center;
      justify-content: center;
      /* End center */
      background: -webkit-linear-gradient(to right, #834d9b, #d04ed6);
      background: linear-gradient(to right, #834d9b, #d04ed6);
    }

    .wrapper a {
      display: inline-block;
      text-decoration: none;
      padding: 15px;
      background-color: #fff;
      border-radius: 3px;
      text-transform: uppercase;
      color: #585858;
      font-family: 'Roboto', sans-serif;
    }

    .modal {
      visibility: hidden;
      opacity: 0;
      position: absolute;
      top: 0;
      right: 0;
      bottom: 0;
      left: 0;
      display: flex;
      align-items: center;
      justify-content: center;
      background: rgba(77, 77, 77, .7);
      transition: all .4s;
    }

    .modal:target {
      visibility: visible;
      opacity: 1;
    }

    .modal__content {
      border-radius: 4px;
      position: relative;
      width: 500px;
      max-width: 90%;
      background: #fff;
      padding: 1em 2em;
    }

    .modal__footer {
      text-align: right;
      a {
        color: #585858;
      }
      i {
        color: #d02d2c;
      }
    }
    .modal__close {
      position: absolute;
      top: 10px;
      right: 10px;
      color: #585858;
      text-decoration: none;
    }    
    ```
* `calc()`: The `calc()` CSS function lets you perform calculations when specifying CSS property values.
* Style empty elements
* Create custom scrollbar
* position sticky
* CSS Scroll Snap
* Dynamic Tooltips
* caret-color
* `::in-range` and `::out-of-range` pseudo-classes
* Fancy text
* Flex gap
* `grayscale()` function: Use the `grayscale()` filter function to convert the input image to grayscale.
* Rounded, gradiant borders:
    HTML:
    ```
    <div class="box gradient-border">
      This is a div with rounded gradient border.
    </div>
    ```
    CSS:
    ```
    .gradient-border {
      border: solid 5px transparent;
      border-radius: 10px;
      background-image: linear-gradient(white, white), 
        linear-gradient(315deg,#833ab4,#fd1d1d 50%,#fcb045);
      background-origin: border-box;
      background-clip: content-box, border-box;
    }

    /* Demo code, unrelated to the feature. */
    .box {
      width: 350px;
      height: 100px;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 100px auto;
    }
    ```
