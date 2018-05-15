class ChangeUrlInPhotos < ActiveRecord::Migration[5.1]
  def change
    rename_column :photos, :url, :image_id
  end
end
