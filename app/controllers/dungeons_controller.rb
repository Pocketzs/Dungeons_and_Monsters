class DungeonsController < ApplicationController
  def index
    @dungeons = Dungeon.all
  end
end