# State Machine

A lot of game systems can be described as finite state machines.

This being the case, it makes sense to work on a shared State Machine class that can be used throughout the project.

This implementation of the state machine is inspired by the [GDQuest](https://gdquest.mavenseed.com/lessons/what-is-a-finite-state-machine) article as well as [this page](https://gameprogrammingpatterns.com/state.html).

The implementation expects developers to create new `State` objects to describe the desired behavior, and instantiate new objects in the scene tree as children of the `StateMachine` object.

A `State` object can also be children of other `State` objects. This is accomplished by allowing each state to be aware of it's parent `State`. This relationship is the reverse of the usual implementation: the **children** state know who are their parent state, not the other way around.

If you wish to perform an action when the state machine changes it's state, you should be able to do so by connecting to the `transitioned` signal from the `StateMachine` object.
This signal carries the relative node-path (from the state machine that emitted it) of the target state, as well as the transition message.

If your state is meant to be short-lived, and you must return to your previous state when transitioning, you should use the `message` property to hold a reference to the previous state. The state machine does **not** do this automatically.
