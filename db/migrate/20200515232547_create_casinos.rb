class CreateCasinos < ActiveRecord::Migration[6.0]
  def change
    create_table :casinos do |t|
      t.string :name

      t.timestamps
    end
  end
end
