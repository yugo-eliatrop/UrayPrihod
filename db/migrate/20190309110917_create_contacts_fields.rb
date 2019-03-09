class CreateContactsFields < ActiveRecord::Migration[5.2]
  def change
    if Contact.first.nil?
      Contact.create!(vk_link: "-", email: "-", phone: "-", address: "-",
                      small_address: "-", requisite: "-")
    end
  end
end
