class Dungeon < ApplicationRecord
  has_many :monsters

  def self.sort_by_most_recently_created
    self.order(created_at: :desc)
  end
end