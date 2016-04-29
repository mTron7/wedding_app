class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |ppl|
      ppl.string :userid
      ppl.string :email
      ppl.string :name
      ppl.string :password

      ppl.timestamps null: false
    end
  end
end
