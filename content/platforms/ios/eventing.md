title=iOS Event Pipeline and Handling
tags=platform, ios
summary=How do events get queued and dispatched in iOS?
~~~~~~

[UIResponder](https://developer.apple.com/documentation/uikit/uiresponder):

An abstract interface for responding to and handling events. ... Responder objects--that is, instances of UIResponder--constitute the event-handling backbone of a UIKit app. There are several kinds of events, including touch events, motion events, remote-control events, and press events. To handle a specific type of event, a responder must override the corresponding methods. For example, to handle touch events, a responder implements the `touchesBegan(_:with:)`, `touchesMoved(_:with:)`, `touchesEnded(_:with:)`, and `touchesCancelled(_:with:)` methods. In the case of touches, the responder uses the event information provided by UIKit to track changes to those touches and to update the app's interface appropriately. ... In addition to handling events, UIKit responders also manage the forwarding of unhandled events to other parts of your app. If a given responder does not handle an event, it forwards that event to the next event in the responder chain. UIKit manages the responder chain dynamically, using predefined rules to determine which object should be next to receive an event. For example, a view forwards events to its superview, and the root view of a hierarchy forwards events to its view controller.

---

[Using Responders and the Responder Chain to Handle Events](https://developer.apple.com/documentation/uikit/touches_presses_and_gestures/using_responders_and_the_responder_chain_to_handle_events): 

Apps receive and handle events using responder objects. A responder object is any instance of the UIResponder class, and common subclasses include UIView, UIViewController, and UIApplication. Responders receive the raw event data and must either handle the event or forward it to another responder object. When your app receives an event, UIKit automatically directs that event to the most appropriate responder object, known as the first responder.

Unhandled events are passed from responder to responder in the active responder chain, which is the dynamic configuration of your app’s responder objects. 

UIKit designates an object as the first responder to an event based on the type of that event. Event types include:

Event type | First responder
---------- | ----------------
Touch events | The view in which the touch occurred.
Press events | The object that has focus.
Shake-motion events | The object that you (or UIKit) designate.
Remote-control events | The object that you (or UIKit) designate.
Editing menu messages | The object that you (or UIKit) designate.

Controls communicate directly with their associated target object using action messages. When the user interacts with a control, the control sends an action message to its target object. Action messages are not events, but they may still take advantage of the responder chain. When the target object of a control is nil, UIKit starts from the target object and traverses the responder chain until it finds an object that implements the appropriate action method.

**Altering the Responder Chain**: You can alter the responder chain by overriding the next property of your responder objects. When you do this, the next responder is the object that you return.

Many UIKit classes already override this property and return specific objects, including:

* UIView objects. If the view is the root view of a view controller, the next responder is the view controller; otherwise, the next responder is the view’s superview.

* UIViewController objects. If the view controller’s view is the root view of a window, the next responder is the window object. If the view controller was presented by another view controller, the next responder is the presenting view controller.

* UIWindow objects. The window's next responder is the UIApplication object.

* UIApplication object. The next responder is the app delegate, but only if the app delegate is an instance of UIResponder and is not a view, view controller, or the app object itself.

