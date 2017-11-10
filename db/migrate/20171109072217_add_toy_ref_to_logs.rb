class AddToyRefToLogs < ActiveRecord::Migration[5.1]
  def change
    add_reference :logs, :toy, foregin_key: true
  end
end
