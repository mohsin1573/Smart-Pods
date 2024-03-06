class Review < ApplicationRecord
  belongs_to :pod
  belongs_to :parent

  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "parent_id", "pod_id", "rating", "updated_at"]
  end
end
