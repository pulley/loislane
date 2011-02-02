class CreateConcerns < ActiveRecord::Migration
  def self.up
    create_table :concerns do |t|
      t.belongs_to :user
      t.belongs_to :commit
      t.string :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :concerns
  end
end
