title=Remote Procedure Call (RPC)
tags=distribution, concept, rpc, reading
summary=Notes and reading on the subject.
~~~~~~

One of the most widely used forms of distributed interaction is the remote invocation, an extension of the notion of “operation invocation” to a distributed context. This type of interaction was first proposed in the form of a remote procedure call (RPC) [Birrell and Nelson 1983; Tay and Ananda 1990] for procedural languages, and has been straightforwardly applied to object-oriented contexts in the form of remote method invocations, for example, in Java RMI [Sun 2000], CORBA [OMG 2002a], Microsoft DCOM [Horstmann and Kirtland 1997; Chung et al. 1998].

(RPC and derivatives: the producer performs a synchronous call, which is processed asynchronously by the consumer.)

By making remote interactions appear the same way as local interactions, the RPC model and its derivatives make distributed programming very easy. This explains their tremendous popularity in distributed computing. Distribution cannot, however, be made completely transparent to the application, because it gives rise to further types of potential failures (e.g., communication failures) that have to be dealt with explicitly. RPC differs from publish/subscribe in terms of coupling: the synchronous nature of RPC introduces a strong time, synchronization (on the consumer side), and also space coupling (since an invoking object holds a remote reference to each of its invokees). (NOTE: The distinction between consumer and producer roles is not straightforward in RPC. We assume here that an RPC that yields a reply attributes a consumer role to the invoker, while the invokee acts as producer. As we will point out, the roles are inverted with asynchronous invocations (which yield no reply).)

(Decoupling synchronization with asynchronous remote invocation: the producer does not expect a reply.)

Several attempts have been made to remove synchronization coupling in remote and avoid blocking the caller thread while waiting for the reply of a remote invocation. A first variant consists in providing a special flavor of asynchronous invocation for remote methods that have no return values, as shown in Figure 5. For instance, CORBA [OMG 2002a] provides a special one-way modifier that can be used to specify such methods. This approach leads to invocations with weak reliability guarantees because the sender does not receive success or failure notifications (this type of interaction is often called *fire-and-forget*). The second, less restrictive variant supports return values, but does not make them directly available to the calling thread. Instead, the result of a remote invocation is a handle through which the actual return values will be accessed when needed. With this approach, known as *future* or *future type message passing* [Yonezawa et al. 1987; Ananda et al. 1992] or *wait-by-necessity* [Caromel 1993], the invoking thread can continue processing and request the return value later, thanks to the handle.

(Decoupling synchronization with future remote invocation: the producer is not blocked and can access the reply later when it becomes available.)

