class CreateFactories < ActiveRecord::Migration[5.2]
  def change
    create_table :factories do |t|
      t.string :name
      t.boolean :operational
      t.integer :rank

      t.timestamps
    end
  end
end
