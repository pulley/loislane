class Approval < ActiveRecord::Base
  belongs_to :user
  belongs_to :commit
end