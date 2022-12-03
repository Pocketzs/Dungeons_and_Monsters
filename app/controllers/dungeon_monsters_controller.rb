class DungeonMonstersController < ApplicationController
  def index
    @dungeon = Dungeon.find(params[:dungeon_id])
    @monsters = @dungeon.monsters
  end
end