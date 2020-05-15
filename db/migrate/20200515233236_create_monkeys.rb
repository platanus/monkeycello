class CreateMonkeys < ActiveRecord::Migration[6.0]
  def change
    create_table :monkeys do |t|
      t.references :casino, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
