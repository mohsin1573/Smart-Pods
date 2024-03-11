class Pod < ApplicationRecord
  validates :grade, inclusion: { in: GRADES }
  validate :teacher_grade_matches_pod_grade

  belongs_to :teacher
  has_many :applications, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures
  accepts_nested_attributes_for :address
  enum status: [ :active, :full, :closed ]

  private

  def teacher_grade_matches_pod_grade
    errors.add(:teacher_id, "must be of the same grade as the pod") unless teacher&.grade == grade
  end

  def self.ransackable_associations(auth_object = nil)
    ["address", "applications", "pictures", "reviews", "teacher"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "grade", "id", "status", "teacher_id", "name", "phone_number","updated_at"]
  end
end
