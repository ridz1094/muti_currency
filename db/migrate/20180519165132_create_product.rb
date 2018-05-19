class CreateProduct < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|

      t.string :name
      t.monetize :price

      t.references :created_by, index: true, null: false
      t.references :updated_by, index: true, null: false
      t.timestamps

    end
  end
end
