class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.string :password
      t.boolean :used

      t.timestamps
    end
  end
end
