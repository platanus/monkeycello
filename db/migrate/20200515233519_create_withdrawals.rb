class CreateWithdrawals < ActiveRecord::Migration[6.0]
  def change
    create_table :withdrawals do |t|
      t.references :monkey, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
