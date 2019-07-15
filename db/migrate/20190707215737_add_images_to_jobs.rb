class AddImagesToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :images, :json
  end
end
