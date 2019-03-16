class Project < ApplicationRecord
  scope :search, -> (search) { where '"Project School Name" like ? OR "Project Description" like ?',
                                     "%#{search}%", "%#{search}%" }
end
