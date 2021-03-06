# Low Violence RPG Project

## Game

The repository for the game source files.

### Installation

If you don't intend to create new assets or modify existing ones, simply clone this repository to work on the game.

If you do plan to work with the [assets sources](https://github.com/lowviolencerpg/assets-source), clone this repository with all the attached sub-modules. (`git clone --recurse-submodules --remote-submodules`)

### Usage

This repository is the main repository for the game's development. This being the case, organization and clarity are of utmost importance.

Keeping the code well organized, documented and clean is essential.

The `main` branch is expected to be functional and playable at all times (after the first release build: v1.0.0).

#### Documentation

A pre-version of the current documentation can be browsed on [lvr-project-docs.netlify.app](https://lvr-project-docs.netlify.app).

Since the project is meant to be open for extensions (mods), it is important that the main interfaces and mechanism of the game are well documented.

This also means that contributions must update the documentation before being merged.

The documentation is separated in sections:

##### Design

This sections holds overarching game-design decisions, documentation and reference. This is the source of truth for the game design.

Documentation of specific features should also be written here, as no gameplay system should be implemented without it's design being described as a documentation page first.

##### Core

This section documents the core systems of the game, that are not necessarily gameplay systems.

You can think of this as a bunch of custom-made tools created to be used by gameplay systems.

For example, you would not see a "movement" section in the _core_ section of the documentation, but you would have a "state machine" section.

### Contributing

**Before contributing, please familiarize yourself with the project's [design goals](./docs/design/design-goals.md).**

Pull requests for new features are not welcome as of now. For bug-fixing, pull requests are still welcome.

For proposal and changes, please open an issue first to discuss the topic.

If an issue is selected for implementation on the code game, it will be used to track the implementation effort, which will be merged with a PR.

### Licensing

All files in this project are subject to the [top-level license](./LICENSE).
