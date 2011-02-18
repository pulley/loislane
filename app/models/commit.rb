class Commit < ActiveRecord::Base
  belongs_to :user
  has_many :voices, :dependent => :destroy

  validates_presence_of :user
  validates_presence_of :message

  alias_attribute :comment, :message # For the bubble partial

  scope :reviewable, :conditions => {:closed => false}, :order => "created_at DESC"

  mount_uploader :diff, DiffUploader

  def approvals
    voices.where(:tone => "approval")
  end

  def concerns
    voices.where(:tone => "concern")
  end

  def diff_source
    if self.diff.file.extension == self.diff.file.filename || self.diff.file.extension == "txt"
      type = "diff"
    else
      type = self.diff.file.extension
      type = "css" if self.diff.file.extension == "css"
      type = "javascript" if self.diff.file.extension == "js"
      type = "html" if ["htm", "html", "erb"].include?(self.diff.file.extension)
      type = "ruby" if self.diff.file.extension == "rb"
    end

    return ":::" + type + "\n" + self.diff.file.read
  end

  def level
    # TODO: Create a better ratio check
    if self.concerns.count > 1
      "high"
    elsif self.concerns.count == 1
      "medium"
    else
      "low"
    end
  end
end
