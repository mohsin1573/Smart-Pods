class Child < ApplicationRecord
  belongs_to :parent
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures
  has_many :applications
end
