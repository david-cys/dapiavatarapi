class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars, id: :uuid do |t|
      t.timestamps
    end
  end
end
