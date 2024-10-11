class CreatePedidos < ActiveRecord::Migration[7.1]
  def change
    create_table :pedidos do |t|
      t.references :cliente, null: false, foreign_key: true
      t.datetime :fecha
      t.decimal :total

      t.timestamps
    end
  end
end
