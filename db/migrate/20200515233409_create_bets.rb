class CreateBets < ActiveRecord::Migration[6.0]
  def change
    create_table :bets do |t|
      t.references :winner, null: false, foreign_key: { to_table: :monkeys }
      t.references :casino, null: false, foreign_key: true

      t.timestamps
    end
  end
end
