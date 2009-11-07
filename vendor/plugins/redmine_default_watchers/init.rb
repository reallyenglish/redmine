require 'redmine'

Redmine::Plugin.register :redmine_default_watchers do
  name 'Redmine Default Watchers plugin'
  author 'Masatomo Nakano'
  description 'This is a plugin for Redmine'
  version '0.0.1'

  menu :top_menu, :default_watchers, {:controller => :default_watchers, :action => :index}, :caption => 'Watchers'
end
