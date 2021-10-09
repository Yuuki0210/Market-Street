class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :postal_code
      t.string :address, null: false
      t.string :name, null: false
      t.integer :payment_method, null: false
      t.integer :total_amount, null: false
      t.integer :potage, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end
