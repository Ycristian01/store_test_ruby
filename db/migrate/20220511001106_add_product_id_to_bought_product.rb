class AddProductIdToBoughtProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :bought_products, :product_id, :integer
  end
end
