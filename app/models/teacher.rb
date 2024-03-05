class Teacher < ApplicationRecord
  has_many :pods,  dependent: :destroy
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures
end
