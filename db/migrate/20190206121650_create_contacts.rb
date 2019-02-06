class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :vk_link
      t.string :email
      t.string :phone
      t.string :address
      t.string :small_address
      t.text :requisite

      t.timestamps
    end
  end
end
