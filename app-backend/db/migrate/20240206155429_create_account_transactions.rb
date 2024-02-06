class CreateAccountTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :account_transactions do |t|
      t.references :account, null: false, foreign_key: true
      t.references :transaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
