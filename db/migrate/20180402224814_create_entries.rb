class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.references :race,               foreign_key: true
      t.references :racer,              foreign_key: true
      t.integer :status,                null: false, default: 0
      t.integer :order,                 null: false
      t.string :car_name,               null: false
      t.decimal :car_weight,            null: false, precision: 5, scale: 2, default: 0.0
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_email

      t.timestamps
    end

    add_index :entries, [:race_id, :racer_id], unique: true
    add_index :entries, [:race_id, :order], unique: true
  end
end
