class Relationship < ActiveRecord::Base

  belongs_to :mentor, class_name: "User", foreign_key: "mentor_id"
  belongs_to :mentee, class_name: "User", foreign_key: "mentee_id"
  has_many :entries, -> { order "created_at DESC" }

end
