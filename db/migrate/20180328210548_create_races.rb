class CreateRaces < ActiveRecord::Migration[5.2]
  def change
    create_table :races do |t|
      t.string :title
      t.text :description
      t.text :rules
      t.jsonb :location
      t.string :slug
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
