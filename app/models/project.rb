class Project < ApplicationRecord
  def self.filter_range(col_name)
    -> (amount, amount_min, amount_max) do
      if amount
        where col_name => amount
      else
        filter = where nil
        if amount_min
          filter = filter.where "\"#{col_name}\" >= ?", amount_min
        end
        if amount_max
          filter = filter.where "\"#{col_name}\" <= ?", amount_max
        end
        filter
      end
    end
  end

  scope :search, -> (search) { where '"Project School Name" like ? OR "Project Description" like ?',
                                     "%#{search}%", "%#{search}%" }
  scope :filter_actual_start_date, filter_range("Project Phase Actual Start Date")
  scope :filter_actual_end_date, filter_range("Project Phase Actual End Date")
  scope :filter_planned_end_date, filter_range("Project Phase Planned End Date")
  scope :filter_budget, filter_range("Project Budget Amount")
  scope :filter_final_estimate , filter_range("Final Estimate of Actual Costs Through End of Phase Amount")
  scope :filter_total_spending, filter_range("Total Phase Actual Spending Amount")

end
