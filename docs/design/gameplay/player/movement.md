# Movement

The player should be able to move around the world as they wish.

The main goals for the movement system is to be smooth and intuitive.

Things that take the control away from the player should be avoided (slide the player in a different direction, push the player away from things, etc)

The main types of player movement are:

- Walk
- Run
- Crouch
- Jump

## Walk and Running

### Bumps and small obstacles

The player should be able to traverse the world without feeling bumps and small obstacles in the ground. A way to implement this is by using something similar to what is described on [this article](https://www.gamasutra.com/view/feature/131508/bsp_collision_detection_as_used_in_.php)
or create the character in a similar fashion as [this implementation](https://www.youtube.com/watch?v=qdskE8PJy6Q).

### Velocity and Acceleration

The velocity difference between walking and running should be noticeable, but not extreme.

Releasing the input from top speed should not mean an instant stop, but the player should not slide too much. This will help the character feel like it has weight behind them.

## Crouching

Crouching should alow the players to move under objects around 3/5 of their standing height.

The speed at which characters move when crouching is 1/3 of their normal movement speed.
