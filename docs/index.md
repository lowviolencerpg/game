# Documentation

Since the project is meant to be open for extensions (mods), it is important that the main interfaces and mechanism of the game are well documented.

This also means that contributions must update the documentation before being merged.

The documentation is separated in sections:

## Design

This sections holds overarching game-design decisions, documentation and reference. This is the source of truth for the game design.

Documentation of specific features should also be written here, as no gameplay system should be implemented without it's design being described as a documentation page first.

## Core

This section documents the core systems of the game, that are not necessarily gameplay systems.

You can think of this as a bunch of custom-made tools created to be used by gameplay systems.

For example, you would not see a "movement" section in the _core_ section of the documentation, but you would have a "state machine" section.

## Contributing

**Before contributing, please familiarize yourself with the project's [design goals](/design/design-goals/).**

Pull requests for new features are not welcome as of now. For bug-fixing, pull requests are still welcome.

For proposal and changes, please open an issue first to discuss the topic.

If an issue is selected for implementation on the code game, it will be used to track the implementation effort, which will be merged with a PR.
