class Picture < ApplicationRecord
  belongs_to  :imageable, polymorphic: true
  has_one_attached :image
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "imageable_id", "imageable_type", "updated_at"]
  end
end
