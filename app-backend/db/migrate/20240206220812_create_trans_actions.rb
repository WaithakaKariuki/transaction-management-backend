class CreateTransActions < ActiveRecord::Migration[7.0]
  def change
    create_table :trans_actions, id: :blob do |t|
      t.integer :amount
      t.references :account, type: :blob,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
# t.references :account, null: false, type: :uuid, foreign_key: true