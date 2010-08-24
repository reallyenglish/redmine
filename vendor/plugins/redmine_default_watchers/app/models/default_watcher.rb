class DefaultWatcher < ActiveRecord::Base
  belongs_to :user
  belongs_to :watcher, :class_name=>"User"
end
