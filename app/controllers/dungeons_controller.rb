class DungeonsController < ApplicationController
  def index
    @dungeons = Dungeon.sort_by_most_recently_created
  end

  def show
    @dungeon = Dungeon.find(params[:id])
  end

  def new
    @dungeon = Dungeon.new
  end

  def create
    Dungeon.create!(dungeon_params)
    redirect_to '/dungeons'
  end

  def edit
    @dungeon = Dungeon.find(params[:id])
  end

  def update
    @dungeon = Dungeon.find(params[:id])
    @dungeon.update!(dungeon_params)
    redirect_to "/dungeons/#{@dungeon.id}"
  end

  private

  def dungeon_params
    params.require(:dungeon).permit(:name, :kind, :hold, :cleared, :visit_count)
  end
end