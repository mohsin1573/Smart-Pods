class Pod < ApplicationRecord
  belongs_to :teacher
  has_many :applications
  has_many :reviews
  has_one :address
  has_many_attached :images
  enum :status, [ :active, :full, :closed ]
end
