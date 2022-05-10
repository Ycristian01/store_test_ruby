class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :number
      t.references :user, null: false, foreign_key: true
      t.string :payment_type
      t.float :total_value

      t.timestamps
    end
  end
end
