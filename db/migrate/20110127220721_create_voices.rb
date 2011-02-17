class CreateVoices < ActiveRecord::Migration
  def self.up
    create_table :voices do |t|
      t.belongs_to :user
      t.belongs_to :commit
      t.string :comment
      t.string :tone

      t.timestamps
    end
  end

  def self.down
    drop_table :voices
  end
end
