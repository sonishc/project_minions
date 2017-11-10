class AddUserRefToToys < ActiveRecord::Migration[5.1]
  def change
    add_reference :toys, :user, foregin_key: true
  end
end
