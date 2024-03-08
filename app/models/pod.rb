class Pod < ApplicationRecord
  belongs_to :teacher
  has_many :applications, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures
  accepts_nested_attributes_for :address
  enum status: [ :active, :full, :closed ]

  def self.ransackable_associations(auth_object = nil)
    ["address", "applications", "pictures", "reviews", "teacher"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "grade", "id", "status", "teacher_id", "name", "phone_number","updated_at"]
  end
end
