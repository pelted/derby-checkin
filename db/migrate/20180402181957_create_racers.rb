class CreateRacers < ActiveRecord::Migration[5.2]
  def change
    create_table :racers do |t|
      t.string :first_name,             null: false
      t.string :last_name
      t.integer :unit,                  default: 0
      t.integer :rank,                  default: 0

      t.timestamps
    end
  end
end
