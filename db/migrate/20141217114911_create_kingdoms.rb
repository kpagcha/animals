class CreateKingdoms < ActiveRecord::Migration
  def change
    create_table :kingdoms do |t|
      t.string :name

      t.timestamps
    end
  end
end
