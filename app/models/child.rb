class Child < ApplicationRecord
  belongs_to :parent
  has_many :applications
  has_many :reviews
  has_one :picture, as: :imageable
end
