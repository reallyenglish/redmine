class WatchersForumController < ApplicationController
  helper :watchers_forum
  include WatchersForumHelper
  before_filter :find_project, :authorize, :except => [ :watch, :unwatch ]

  def index
p 'index'
  end

  def watch
p 'watch'
    set_watcher(true)
  end
  
  def unwatch
p 'unwatch'
    set_watcher(false)
  end

  private
  
  def find_project   
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def find_user
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def set_watcher(watching)
    user = User.find(params[:user_id])
    klass = Object.const_get(params[:object_type].camelcase)
    watched = klass.find(params[:object_id])
    
    watched.set_watcher(user, watching)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render(:update) {|page| page.replace_html 'watcher_' + params[:object_id] + '_' + user.id.to_s, watcher_link(watched, user)} }
    end
  rescue ::ActionController::RedirectBackError
    render :text => (watching ? 'Watcher added.' : 'Watcher removed.'), :layout => true
  end
end
