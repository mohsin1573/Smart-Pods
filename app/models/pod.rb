class Pod < ApplicationRecord
  belongs_to :teacher
  has_many :applications
  has_many :reviews
  has_one :address
  has_many :pictures, as: :imageable

  enum :status, [ :active, :full, :closed ]
end
