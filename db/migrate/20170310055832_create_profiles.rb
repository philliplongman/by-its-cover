class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.belongs_to :user

      t.timestamps        null: false

      t.string :username, null: false
      t.string :picture
      t.string :gender
      t.date   :birthday
      t.string :location
    end

    add_index :profiles, :username, unique: true
  end
end
