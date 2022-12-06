class Monster < ApplicationRecord
  belongs_to :dungeon

  def self.all_dead
    where(dead: true)
  end
end