class CreateStore < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.boolean :open
      t.string :name
      t.integer :sold_per_month

      t.timestamps
    end
  end
end
