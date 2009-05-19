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

status
------

The `status` command visualizes the submodules tree and each modules status:

	subito status

### sample output

extranett
+--+ Extensions
|  +- admin_breadcrumbs
|  +- application_theme
|  +- blog
|  +- change_author
|  +- comments
|  +- conditional_tags
|  +- copy_move -> Changed but not updated.
|  +- dashboard -> Changed but not updated.
|  +- dav
|  +- gallery -> Changed but not updated.
|  +- gallery_multisite -> Changed but not updated.
|  +- help
|  +- import_export
|  +- index_page
|  +- multi_site -> Changed but not updated.
|  +- navigation_tags
|  +- page_preview
|  +- paginate
|  +- paperclipped -> Your branch is ahead of 'origin/master' by 9 commits.
|  +- paperclipped_multisite
|  +- ray
|  +- scoped_admin
|  +- search
|  +- search_multi_site
|  +- seo_help
|  +- settings
|  +- share_layouts -> Changed but not updated.
|  +- sibling_tags
|  +- site_watcher
|  +- sns -> Changed but not updated.
|  +- sns_minifier
|  +- sns_multisite
|  +- sns_sass_filter
|  +- tags
|  +- wordpress_migrator
|  +- wym_editor_filter -> Your branch is ahead of 'origin/master' by 8 commits.
+--+ Plugins
|  +- has_many_polymorphs
|  +- attachment_fu
|  +- exceptional
|  +- rpm
|  +- will_paginate
+--+ Radiant
   +--+ Plugins
      +- dataset -> Your branch is behind 'origin/master' by 21 commits, and can be fast-forwarded.
      +- spec_integration -> Your branch is behind 'origin/master' by 6 commits, and can be fast-forwarded.
      +- vizres -> Your branch is behind 'origin/master' by 5 commits, and can be fast-forwarded.
      
log
----

The `log` command visualizes the submodule tree and each modules last log entry:

	subito log

The `log` command has one option:

* --remotes adds submodule remotes to the view

### sample output

Show a project submodule logs: `subito log`

extranett
+--+ Extensions
|  +- admin_breadcrumbs ->  Changed deprecated page_edit_path(page) to edit_admin_page_path(page)
|  +- application_theme ->  updated docs
|  +- blog ->  configurable home location for blog posts when dashboard is installed
|  +- change_author ->  properly find the current_user
|  +- comments ->  Use application_controller in Radiant 0.8.0 due upgrade to Rails 2.3.2
|  +- conditional_tags ->  Ready for v0.4
|  +- copy_move ->  The Copy Move Extension is now aware of multi site installations
|  +- dashboard ->  Merge branch 'master' of git://github.com/saturnflyer/radiant-dashboard-extension
|  +- dav ->  Don't use tempfile 'cause it generates ugly file names.
|  +- gallery ->  Merge branch 'master' of git://github.com/pilu/radiant-gallery
|  +- gallery_multisite ->  Fixed wrong call to import path without a site
|  +- help ->  Use application_controller in Radiant 0.8.0 due upgrade to Rails 2.3.2
|  +- import_export ->  Updated for Edge. Radiant::ExtensionsMeta no longer extant.
|  +- index_page ->  avoiding siteLanguage ext. error..
|  +- multi_site ->  Site.several? causes a 'ArgumentError (A copy of MultiSite::ScopedValidation has been removed from the module tree but is still active)' in development mode
|  +- navigation_tags ->  including TagHelper
|  +- page_preview ->  Use application_controller in Radiant 0.8.0 due upgrade to Rails 2.3.2
|  +- paginate ->  Merge branch 'master' of git://github.com/saturnflyer/radiant-paginate-extension
|  +- paperclipped ->  Merge branch 'master' of git://github.com/kbingman/paperclipped
|  +- paperclipped_multisite ->  Merge branch 'master' of git://github.com/spanner/radiant-paperclipped_multisite-extension
|  +- ray ->  fix broken output message on install, when there was no exact match but some possible matches. i.e. ray:i name=calendar
|  +- scoped_admin ->  Merge branch 'master' of git://github.com/spanner/radiant-scoped-admin-extension
|  +- search ->  spec
|  +- search_multi_site ->  Initial import
|  +- seo_help ->  added inherit to r:meta
|  +- settings ->  Converted settings description to a text area, and added a few styling improvements.
|  +- share_layouts ->  Prevent <r:date /> from breaking when using a dummy page.
|  +- sibling_tags ->  Switched README format to markdown.
|  +- site_watcher ->  Fix nil reference when site has no 404 page
|  +- sns ->  Updated specs (and some application code) for 0.7.
|  +- sns_minifier ->  A few minor changes to be compatible with radiant/radiant-sns-extension. 1) Rename app/views/admin/text_asset app/views/admin/text_assets, 2) In sns_minifier_extension.rb change admin.text_asset.edit.add to admin.text_assets.edit.add. Pretty simple just keeping up with the pluralizations. '
|  +- sns_multisite ->  Pluralize admin ui for text asset
|  +- sns_sass_filter ->  Updated descriptions for v0.3
|  +- tags ->  Updated has_many_polymorphs
|  +- wordpress_migrator ->  extra fixes
|  +- wym_editor_filter ->  Merge branch 'master' of git://github.com/netzpirat/radiant-wym-editor-filter-extension
+--+ Plugins
|  +- has_many_polymorphs ->  Changelog.
|  +- attachment_fu ->  ruby 1.9 syntax compatibility fixes
|  +- exceptional ->  Change my email address
|  +- rpm ->  Agent release 2.8.11
|  +- will_paginate ->  release v2.3.8 for Rails 2.3
+--+ Radiant
   +--+ Plugins
      +- dataset ->  name_to_sym for naming models
      +- spec_integration ->  Don't alias rescue_action_without_fast_errors...instead call it directly when in an integration example
      +- vizres ->  updated readme

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

Generate a bundle with remotes: `subito bundle generate --remotes`

	---
	- name: dav
	  hub: netzpirat
	- name: gallery
	  hub: netzpirat
	  - remote: pilu/radiant-gallery
	- name: page_preview
	  hub: netzpirat
	  - remote: vigetlabs/radiant_page_preview_extension
	  - remote: saturnflyer/radiant_page_preview_extension
	- name: ray
	  hub: netzpirat
	  - remote: johnmuhl/radiant-ray-extension
	- name: sns
	  hub: netzpirat
	  - remote: SwankInnovations/radiant-sns-extension
	  - remote: MrGossett/radiant-sns-extension
	- name: wym_editor_filter
	  hub: netzpirat
	  - remote: jomz/wymeditor-for-radiant

As you can see the format is compatible with [Ray's extensions.yml](http://wiki.github.com/johnmuhl/radiant-ray-extension/usage)