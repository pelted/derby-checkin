class CreateRacers < ActiveRecord::Migration[5.2]
  def change
    create_table :racers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :unit
      t.string :rank

      t.timestamps
    end
  end
end
