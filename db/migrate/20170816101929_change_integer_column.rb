class ChangeIntegerColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :restaurants, :phone_number, :integer, limit: 8
  end
end
