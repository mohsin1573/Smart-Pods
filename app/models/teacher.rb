class Teacher < ApplicationRecord
  validates :grade, inclusion: { in: GRADES }

  has_many :pods,  dependent: :destroy
  has_many :pictures, as: :imageable, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :pictures

  def self.ransackable_associations(auth_object = nil)
    ["pictures", "pods", "address"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["bio", "created_at", "id", "name", "updated_at", "phone_number", "education", "grade"]
  end
end
