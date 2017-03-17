class AddShippriceToPeople < ActiveRecord::Migration
  def change
    add_column :people, :shipprice, :float
  end
end
