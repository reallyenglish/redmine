class DefaultWatchersController < ApplicationController
  unloadable

  def index
    @all_active_users = User.active.find(:all, :order => "firstname")
    @default_watchers = DefaultWatcher.find_all_by_user_id(User.current.id).map{|u| u.watcher}
  end

  def update
    DefaultWatcher.find_all_by_user_id(User.current.id).each{|w| w.destroy}
    params[:watcher_ids].each do |id|
      DefaultWatcher.find_or_create_by_user_id_and_watcher_id(User.current.id, id)
    end
    redirect_to :action=>:index
  end
end
