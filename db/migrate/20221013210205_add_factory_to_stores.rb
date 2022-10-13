class AddFactoryToStores < ActiveRecord::Migration[5.2]
  def change
    add_reference :stores, :factory, foreign_key: true
  end
end
