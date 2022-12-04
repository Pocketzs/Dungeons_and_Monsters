class DungeonsController < ApplicationController
  def index
    @dungeons = Dungeon.sort_by_most_recently_created
  end

  def show
    @dungeon = Dungeon.find(params[:id])
  end
end