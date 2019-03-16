class ConvertProjectBudgetToInt < ActiveRecord::Migration[5.2]
  def change
    change_column :projects, :"Project Budget Amount",
                  :integer, using: '"Project Budget Amount"::integer'
  end
end
