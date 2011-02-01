class CreateCommits < ActiveRecord::Migration
  def self.up
    create_table :commits do |t|
      t.belongs_to :user
      t.string :diff
      t.string :message
      t.boolean :closed, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :commits
  end
end
