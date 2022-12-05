class DungeonMonstersController < ApplicationController
  def index
    @dungeon = Dungeon.find(params[:dungeon_id])
    @monsters = @dungeon.monsters
  end

  def new
    @dungeon = Dungeon.find(params[:dungeon_id])
    @monster = @dungeon.monsters.new
  end
end