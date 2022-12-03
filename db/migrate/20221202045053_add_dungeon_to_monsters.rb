class AddDungeonToMonsters < ActiveRecord::Migration[5.2]
  def change
    add_reference :monsters, :dungeon, foreign_key: true
  end
end
