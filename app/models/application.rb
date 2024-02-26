class Application < ApplicationRecord
  belongs_to :parent
  belongs_to :pod
end
