class AddShippingAddressIdToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :shipping_address_id, :integer
  end
end
