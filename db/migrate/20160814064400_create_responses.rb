class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :guest1
      t.string :guest2
      t.string :attending
      t.string :comments
      t.timestamps null: false
    end
  end
end
