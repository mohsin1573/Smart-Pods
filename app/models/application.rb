class Application < ApplicationRecord
  belongs_to :parent
  belongs_to :pod

  enum :status, [ :pending, :approved, :rejected ]

  def self.ransackable_attributes(auth_object = nil)
    ["child_id", "created_at", "id", "parent_id", "pod_id", "status", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["parent", "pod"]
  end
end
