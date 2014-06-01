class Entry < ActiveRecord::Base

  belongs_to :author, :class_name => "User", :foreign_key => "author_id"
  has_many :comments, -> { order "created_at DESC" }

  before_create :set_created_at_to_now

  def set_created_at_to_now
    self.created_at = Time.now if !self.created_at
  end

end
