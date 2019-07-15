class AddWppToInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :infos, :wpp, :string
  end
end
