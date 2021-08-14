# Minigame manager

One of the core principles of the project is to allow others to create custom mods, and then hook these into the core gameplay.

Conceptually, this means that any part of the game where the player is taken out of the main context (basic movement and camera control), could be described as a minigame.

For the purpose of this documentation (and this project), minigames are small interactive experiences (games), that take user input and take control of what is displayed for the player.

To allow others to extend this system easily without the need to edit multiple files and replace all instances of one minigame with another, each minigame will be instantiated via a global manager, which has it's own methods to replace and add other minigames.

This is a class that is loaded at startup as a Singleton, and it will always be available to other scripts.

When using the manager to load a minigame, you can send in a `Dictionary` of values to be taken into account by the `Minigame.enter` method. This method will also return a `Dictionary` with this information:

- `minigame_path`: Absolute Node Path of the minigame Node
- `response`: The (optional) response form the minigame `enter` function

This information is meant to be used to connect to any necessary signals from the minigame to the rest of the game.

Whenever a minigame considers itself finished, it will call it's own `end` method. This method should also emit a `minigame_finished` signal with a message `Dictionary` (empty by default).

Other systems should listen to this signal if they must do any processing with an output from the minigame, like: Change dialogue based on the resulting score of a cooking minigame, or reward the player with different items based on the result of a cards minigame.

## Minigames

Minigames are scene in which the root is a `Minigame` node.

Each minigame is responsible for it's own actions.

A minigame should **not** access any resource from outside it's own scene tree (with the exception of Autoloads).

> If your minigame must perform an action that requires interacting with other systems, and there is not an existing Autoload to manage it, please open an Issue to discuss it's implementation.
>
> Creating a new Autoload manager is a task that affects the core game logic significantly, so PRs that do so without an issue first will be rejected.
