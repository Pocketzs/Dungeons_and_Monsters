class Monster < ApplicationRecord
  belongs_to :dungeon

  def self.all_dead
    self.where(dead: true)
  end

  def self.alpha_sort_by_name
    self.order(:name)
  end

  def self.attribute_threshold_select(threshold, attribute)
    self.where("#{attribute} > #{threshold}")
  end
end