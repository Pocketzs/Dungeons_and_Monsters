class DungeonMonstersController < ApplicationController
  def index
    @dungeon = Dungeon.find(params[:dungeon_id])
    if params[:sort] == 'alpha'
      @monsters = @dungeon.monsters.alpha_sort_by_name
    elsif params[:sort] == 'threshold'
      @monsters = @dungeon.monsters.attribute_threshold_select(params[:threshold], params[:attribute])
    else
      @monsters = @dungeon.monsters
    end
  end

  def new
    @dungeon = Dungeon.find(params[:dungeon_id])
    @monster = @dungeon.monsters.new
 end

  def create
    dungeon = Dungeon.find(params[:dungeon_id])
    dungeon.monsters.create!(monster_params)
    redirect_to "/dungeons/#{dungeon.id}/monsters"
  end

  private

  def monster_params
    params.require(:monster).permit(:name, :dead, :health, :level, :soul_size, :loot)
  end
end