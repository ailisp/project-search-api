class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :'Project Geographic District'
      t.string :'Project Building Identifier'
      t.string :'Project School Name'
      t.string :'Project Type'
      t.string :'Project Description'
      t.string :'Project Phase Name'
      t.string :'Project Status Name'
      t.date :'Project Phase Actual Start Date'
      t.date :'Project Phase Planned End Date'
      t.date :'Project Phase Actual End Date'
      t.string :'Project Budget Amount'
      t.integer :'Final Estimate of Actual Costs Through End of Phase Amount'
      t.integer :'Total Phase Actual Spending Amount'
      t.string :'DSF Number'

    end
  end
end
