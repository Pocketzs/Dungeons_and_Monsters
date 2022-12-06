class Dungeon < ApplicationRecord
  has_many :monsters, dependent: :destroy

  def self.sort_by_most_recently_created
    self.order(created_at: :desc)
  end

  def monster_count
    monsters.count
  end
end