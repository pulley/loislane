class Approval < ActiveRecord::Base
  belongs_to :user
  belongs_to :commit

  validates_presence_of :comment
end
