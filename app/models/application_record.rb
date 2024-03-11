class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  GRADES = (1..10).to_a
end
