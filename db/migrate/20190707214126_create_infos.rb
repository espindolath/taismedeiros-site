class CreateInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :infos do |t|
      t.string :name
      t.text :desc
      t.string :email
      t.string :tel
      t.string :behance
      t.string :instagram
      t.string :facebook

      t.timestamps
    end
  end
end
