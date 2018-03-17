class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :post_id
      t.float :amount
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
  end
end
