class MonstersController < ApplicationController
  def index
    @monsters = Monster.all_dead
  end

  def show
    @monster = Monster.find(params[:id])
  end

  def edit
    @monster = Monster.find(params[:id])
  end

  def update
    monster = Monster.find(params[:id])
    monster.update!(monster_params)
    redirect_to "/monsters/#{monster.id}"
  end

  private

  def monster_params
    params.require(:monster).permit(:name, :health, :level, :soul_size, :dead, :loot)
  end
end