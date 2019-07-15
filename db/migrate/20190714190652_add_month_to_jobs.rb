class AddMonthToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :month, :string
  end
end
