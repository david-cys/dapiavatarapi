class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles, id: :uuid do |t|
      t.text :description
      t.text :display_name
      t.text :email

      t.timestamps
    end
  end
end
