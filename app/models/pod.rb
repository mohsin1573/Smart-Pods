class Pod < ApplicationRecord
  belongs_to :teacher
  has_many :applications, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures
  enum :status, [ :active, :full, :closed ]
end
