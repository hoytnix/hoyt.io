Readme
======

This file will serve as the master file for documentation until I accumulate enough here to move it into individual files.


## Automatic Imports

Because of the nature of how iterable-imports (`lib.imports`) are implemented,
there are a few requirements for building modules:

*   The top-level init-file next to `app.py` must import blueprints.
    (Which is easy enough to commit to Git and re-use with relative-imports.)
*   The blueprints-module (`hive.blueprints`) must import its sub-modules.
*   Blueprint sub-modules must import their view-blueprints and all models.

The latter two sound like a pain and you may ask "Why even bother with iterable-imports when they don't seem to be saving you any work?"

Well, that's when the module-generator (similar to Ember-CLI) will save a lot of
time and pain. :-)


## "Master" and "Development" Branches

As of this writing there are two primary branches: `master` and `development`.

The `master`-branch is reserved for publishing: there should always be a working version available to make changes to the live website.
The `development`-branch is essentially for working on the changes before they are finalized.


## Using Frozen Flask

For the purposes of this application the API of Frozen Flask has been modified in `lib/freezer.py`. To keep everything consistent, please try to import Freezer like `hive.extensions.freezer` when possible. The `freezer` is uninstantiated to prevent circular imports.
