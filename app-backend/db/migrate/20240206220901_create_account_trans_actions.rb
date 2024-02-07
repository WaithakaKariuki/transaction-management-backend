class CreateAccountTransActions < ActiveRecord::Migration[7.0]
  def change
    create_table :account_trans_actions do |t|
      t.references :account, null: false, foreign_key: true
      t.references :trans_action, null: false, foreign_key: true

      t.timestamps
    end
  end
end
