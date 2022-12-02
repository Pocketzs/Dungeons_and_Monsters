class CreateMonsters < ActiveRecord::Migration[5.2]
  def change
    create_table :monsters do |t|
      t.string :name
      t.boolean :dead
      t.integer :health
      t.integer :level
      t.string :soul_size
      t.string :loot

      t.timestamps 
    end
  end
end
