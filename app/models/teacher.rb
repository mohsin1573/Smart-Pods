class Teacher < ApplicationRecord
  has_many :pods,  dependent: :destroy
end
