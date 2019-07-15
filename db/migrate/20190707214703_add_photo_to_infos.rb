class AddPhotoToInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :infos, :photo, :string
  end
end
