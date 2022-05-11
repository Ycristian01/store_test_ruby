class RemoveShippingAddressFromOrder < ActiveRecord::Migration[6.1]
  def change
    remove_reference :orders, :shipping_address, null: false, foreign_key: true
  end
end
