class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :common_name
      t.string :subspecie
      t.integer :kingdom_id

      t.timestamps
    end
  end
end
