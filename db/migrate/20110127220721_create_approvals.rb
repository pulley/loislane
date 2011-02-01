class CreateApprovals < ActiveRecord::Migration
  def self.up
    create_table :approvals do |t|
      t.belongs_to :user
      t.belongs_to :commit
      t.string :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :approvals
  end
end
