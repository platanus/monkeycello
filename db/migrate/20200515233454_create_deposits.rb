class CreateDeposits < ActiveRecord::Migration[6.0]
  def change
    create_table :deposits do |t|
      t.references :monkey, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
