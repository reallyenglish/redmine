require 'redmine'

RAILS_DEFAULT_LOGGER.info 'Wachers Forum'

Redmine::Plugin.register :redmine_watchers_forum do
  name 'Redmine Watchers Forum plugin'
  author 'Masatomo Nakano'
  description 'Bulk update watches on forums'
  version '0.0.1'

  project_module :watchers_forum do
    permission :view_watchers_forum_tab, {:watchers_forum => :index}
  end

  menu :project_menu, :watchers_forum, { :controller => 'watchers_forum', :action => 'index' }, :caption => 'Watchers on Forums'
end

Rails::Plugin.class_eval do
   def reloadable!
     load_paths.each { |p| ActiveSupport::Dependencies.load_once_paths.delete(p) }
   end
end

reloadable!
