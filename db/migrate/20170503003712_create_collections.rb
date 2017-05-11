class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.belongs_to :user

      t.string :title, limit: 100, null: false
      t.string :description, limit: 500, default: ""

      t.timestamps null: false

      t.index [:user_id, :title], unique: true
    end
  end
end
