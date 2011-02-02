class Commit < ActiveRecord::Base
  belongs_to :user
  has_many :concerns, :dependent => :destroy
  has_many :approvals, :dependent => :destroy

  validates_presence_of :user
  validates_presence_of :message

  scope :reviewable, :conditions => {:closed => false}, :order => "created_at DESC"

  mount_uploader :diff, DiffUploader

  def diff_source
    type = "diff"
    type = "css" if self.diff.file.extension == "css"
    type = "javascript" if self.diff.file.extension == "js"
    type = "html" if ["htm", "html", "erb"].include?(self.diff.file.extension)
    type = "ruby" if self.diff.file.extension == "rb"

    return ":::" + type + "\n" + self.diff.file.read
  end

  def level
    # TODO: Create a better ratio check
    if self.concerns.size > 1
      "high"
    elsif self.concerns.size == 1
      "medium"
    else
      "low"
    end
  end
end
