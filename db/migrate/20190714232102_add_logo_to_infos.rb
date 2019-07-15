class AddLogoToInfos < ActiveRecord::Migration[5.2]
  def change
  	 add_column :infos, :logo, :string
  end
end
