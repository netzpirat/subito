Subito
======

`subito` is a Git *Submodule Inspection Tool* and helps to manage your Radiant extensions and Rails Plugins.
If you just want to manage your Radiant extensions then [Ray](http://github.com/johnmuhl/radiant-ray-extension/tree/master) is your friend.

show
----

The `show` command visualizes the submodule tree:

	subito show

The `show` command has two options:

* --remotes adds submodule remotes to the view
* --verbose adds verbose output to the tree

### sample output

Show a verbose project structure with remotes: `subito show --remotes --verbose`

	extranett (Radiant Project)
	+--+ Extensions
	|  +- dav
	|  |  +- origin/master -> git@github.com:netzpirat/radiant-dav-extension.git
	|  +- gallery
	|  |  +- pilu/master -> git://github.com/pilu/radiant-gallery.git
	|  |  +- origin/master -> git@github.com:netzpirat/radiant-gallery-extension.git
	|  +- page_preview
	|  |  +- vigetlabs/master -> git://github.com/vigetlabs/radiant_page_preview_extension.git
	|  |  +- saturnflyer/master -> git://github.com/saturnflyer/radiant_page_preview_extension.git
	|  |  +- origin/master -> git@github.com:netzpirat/radiant-page-preview-extension.git
	|  +- ray
	|  |  +- johnmuhl/experimental -> git://github.com/johnmuhl/radiant-ray-extension.git
	|  |  +- origin/experimental -> git@github.com:netzpirat/radiant-ray-extension.git
	|  +- sns
	|  |  +- SwankInnovations/master -> git://github.com/SwankInnovations/radiant-sns-extension.git
	|  |  +- MrGossett/master -> git://github.com/MrGossett/radiant-sns-extension.git
	|  |  +- origin/master -> git@github.com:netzpirat/radiant-sns-extension.git
	|  +- wym_editor_filter
	|     +- origin/master -> git@github.com:netzpirat/radiant-wym-editor-filter-extension.git
	|     +- jomz/master -> git://github.com/jomz/wymeditor-for-radiant.git
	+--+ Plugins
	|  +- attachment_fu
	|     +- origin/master -> git://github.com/technoweenie/attachment_fu.git
	+--+ Radiant
	   |  +- origin/master -> git@github.com:netzpirat/radiant.git
	   |  +- radiant/master -> git://github.com/radiant/radiant.git
	   +--+ Plugins
	      +- dataset
	      |  +- origin/ -> git://github.com/aiwilliams/dataset.git
	      +- spec_integration
	      |  +- origin/ -> git://github.com/aiwilliams/spec_integration.git
	      +- vizres
	         +- origin/ -> git://github.com/pelargir/vizres.git

bundle
------

The `bundle` command can `generate` a bundle from an actual submodule configuration within a project.
The bundle file will be written to `config\extensions.yml` in the project root.

### generate

	subito bundle generate

The `bundle generate` command has two options:

* --remotes adds submodule remotes to the view
* --verbose adds verbose output to the tree

#### sample output

Generate a bundle with remotes: `subito bundle generate --remotes --verbose`

	***Process extension 'dav'
	  - Remote'netzpirat/radiant-dav-extension'registered
	***Process extension 'gallery'
	  - Remote'pilu/radiant-gallery'registered
	  - Remote'netzpirat/radiant-gallery-extension'registered
	***Process extension 'page_preview'
	  - Remote'vigetlabs/radiant_page_preview_extension'registered
	  - Remote'saturnflyer/radiant_page_preview_extension'registered
	  - Remote'netzpirat/radiant-page-preview-extension'registered
	***Process extension 'paperclipped'
	  - Remote'netzpirat/radiant-paperclipped-extension'registered
	***Process extension 'paperclipped_multisite'
	  - Remote'netzpirat/radiant-paperclipped-multisite-extension'registered
	***Process extension 'ray'
	  - Remote'johnmuhl/radiant-ray-extension'registered
	  - Remote'netzpirat/radiant-ray-extension'registered
	***Process extension 'sns'
	  - Remote'SwankInnovations/radiant-sns-extension'registered
	  - Remote'MrGossett/radiant-sns-extension'registered
	  - Remote'netzpirat/radiant-sns-extension'registered
	***Process extension 'wym_editor_filter'
	  - Remote'netzpirat/radiant-wym-editor-filter-extension'registered
	  - Remote'jomz/wymeditor-for-radiant'registered
	Bundle written to config/extensions.yml

As you can see the format is compatible with [Ray's extensions.yml](http://wiki.github.com/johnmuhl/radiant-ray-extension/usage)