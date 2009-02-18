subito
======

`subito` is a Git *submodule inspection tool* and helps to manage your Radiant extensions and Rails Plugins.

show
----

The `show` command visualizes the submodule tree:

	subito show

The `show` command has two options:

* --remotes adds submodule remotes to the view
* --verbose adds verbose output to the tree

bundle
------

The `bundle` command can `generate` a bundle from an actual submodule configuration within a project. The bundle file will be written to `config\extensions.yml` in the project root.

### generate

	subito bundle generate
	
The `bundle generate` command has two options:

* --remotes adds submodule remotes to the view
* --verbose adds verbose output to the tree
	

