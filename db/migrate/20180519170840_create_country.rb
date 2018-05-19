class CreateCountry < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|

      t.string :name
      t.string :code, null: false, default: "", unique: true

      t.references :created_by, index: true, null: false
      t.references :updated_by, index: true, null: false
      t.timestamps
      
    end
  end
end
