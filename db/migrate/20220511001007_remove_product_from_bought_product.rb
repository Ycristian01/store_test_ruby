class RemoveProductFromBoughtProduct < ActiveRecord::Migration[6.1]
  def change
    remove_reference :bought_products, :product, null: false, foreign_key: true
  end
end
