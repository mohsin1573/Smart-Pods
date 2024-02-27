class Child < ApplicationRecord
  belongs_to :parent
  has_one :picture, as: :imageable
  has_many :applications
end
