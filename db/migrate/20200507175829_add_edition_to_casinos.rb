class AddEditionToCasinos < ActiveRecord::Migration[5.2]
  def change
    add_column :casinos, :edition, :string
  end
end
