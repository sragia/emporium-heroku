class AddCartIdToPeople < ActiveRecord::Migration
  def change
    add_column :people, :cartId, :integer
  end
end
