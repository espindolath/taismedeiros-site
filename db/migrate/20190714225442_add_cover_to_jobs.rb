class AddCoverToJobs < ActiveRecord::Migration[5.2]
  def change
  	add_column :jobs, :covers, :json
  end
end
