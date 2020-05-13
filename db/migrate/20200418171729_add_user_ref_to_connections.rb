class AddUserRefToConnections < ActiveRecord::Migration[6.0]
  def change
    add_reference :connections, :user, null: false, foreign_key: true
  end
end
