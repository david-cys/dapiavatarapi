class AddProfileUuidToAvatars < ActiveRecord::Migration
  def change
    add_column :avatars, :profile_uuid, :text
  end
end
