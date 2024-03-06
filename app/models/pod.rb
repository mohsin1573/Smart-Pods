class Pod < ApplicationRecord
  belongs_to :teacher
  has_many :applications, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures
  enum :status, [ :active, :full, :closed ]

  def self.ransackable_associations(auth_object = nil)
    ["address", "applications", "pictures", "reviews", "teacher"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "grade", "id", "location", "status", "teacher_id", "title", "updated_at"]
  end
end
