class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :name
      t.string :attending
      t.string :comments
      t.timestamps null: false
    end
  end
end
