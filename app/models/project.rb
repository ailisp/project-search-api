class Project < ApplicationRecord
  scope :school_name, -> (school_name) { where "Project School Name": school_name }
  scope :description, -> (description) { where "Project Description": description }
end
