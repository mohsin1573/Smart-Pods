class Application < ApplicationRecord
  belongs_to :parent
  belongs_to :pod

  enum :status, [ :pending, :approved, :rejected ]
end
