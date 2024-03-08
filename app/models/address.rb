class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  def self.ransackable_attributes(auth_object = nil)
    ["city", "created_at", "id", "pod_id", "state", "street", "updated_at", "zipcode"]
  end
end
