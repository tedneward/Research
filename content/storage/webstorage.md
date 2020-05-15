title=Web Storage
tags=storage, browser, embedded
summary=Mechanisms by which browsers can store key/value pairs, in a much more intuitive fashion than using cookies.
~~~~~~

"The two mechanisms within Web Storage are as follows:
* sessionStorage maintains a separate storage area for each given origin that's available for the duration of the page session (as long as the browser is open, including page reloads and restores)
  * Stores data only for a session, meaning that the data is stored until the browser (or tab) is closed.
  * Data is never transferred to the server.
  * Storage limit is larger than a cookie (at most 5MB).

* localStorage does the same thing, but persists even when the browser is closed and reopened.
  * Stores data with no expiration date, and gets cleared only through JavaScript, or clearing the Browser cache / Locally Stored Data.
  * Storage limit is the maximum amongst the three.

These mechanisms are available via the `Window.sessionStorage` and `Window.localStorage` properties (to be more precise, in supporting browsers the Window object implements the `WindowLocalStorage` and `WindowSessionStorage` objects, which the `localStorage` and `sessionStorage` properties hang off) — invoking one of these will create an instance of the `Storage` object, through which data items can be set, retrieved and removed. A different `Storage` object is used for the `sessionStorage` and `localStorage` for each origin — they function and are controlled separately."

[Website](https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API)

