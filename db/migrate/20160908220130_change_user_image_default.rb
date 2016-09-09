class ChangeUserImageDefault < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :image_url
    add_column :users, :image_url, :string, default: "https://www.myzydeco.com/assets/blank_user_icon.png"
  end
end
