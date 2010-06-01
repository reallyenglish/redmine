class CreateDefaultWatchers < ActiveRecord::Migration
  def self.up
    create_table :default_watchers do |t|
      t.column :user_id, :integer
      t.column :watcher_id, :integer
    end
  end

  def self.down
    drop_table :default_watchers
  end
end
