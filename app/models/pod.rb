class Pod < ApplicationRecord
  belongs_to :teacher
  has_many :applications, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many_attached :images
  enum :status, [ :active, :full, :closed ]
end
