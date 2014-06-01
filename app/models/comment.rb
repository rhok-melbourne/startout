class Comment < ActiveRecord::Base

  belongs_to :entry, :class_name => "Entry", :foreign_key => "entry_id"
  belongs_to :author, :class_name => "User", :foreign_key => "author_id"

  before_create :set_created_at_to_now

  def set_created_at_to_now
    self.created_at = Time.now
  end

end
