class Review < ApplicationRecord
  belongs_to :pod
  belongs_to :parent
end
