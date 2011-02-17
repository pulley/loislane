class Voice < ActiveRecord::Base
  belongs_to :user
  belongs_to :commit

  validates_presence_of :comment
  validates_presence_of :tone

  def self.tones
    ["comment", "concern", "approval"]
  end
end
