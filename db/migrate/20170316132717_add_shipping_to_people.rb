class AddShippingToPeople < ActiveRecord::Migration
  def change
    add_column :people, :shipping, :string
    add_column :people, :payment, :string
  end
end
