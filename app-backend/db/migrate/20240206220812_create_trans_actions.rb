class CreateTransActions < ActiveRecord::Migration[7.0]
  def change
    create_table :trans_actions,  id: :string do |t|
      t.integer :amount

      t.timestamps
    end
  end
end
