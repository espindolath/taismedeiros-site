class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :desc
      t.string :client
      t.string :year
      t.text :words

      t.timestamps
    end
  end
end
