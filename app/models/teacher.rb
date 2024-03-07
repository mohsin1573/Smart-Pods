class Teacher < ApplicationRecord
  has_many :pods,  dependent: :destroy
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures

  def self.ransackable_associations(auth_object = nil)
    ["pictures", "pods"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["bio", "created_at", "id", "name", "updated_at"]
  end
end
