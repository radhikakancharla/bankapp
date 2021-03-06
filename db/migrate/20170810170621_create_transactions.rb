class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string   :category, null: false
      t.decimal  :amount, null: false
      t.belongs_to :account, index:true, null: false
      t.timestamps
    end
    add_foreign_key :transactions, :accounts
  end
end
