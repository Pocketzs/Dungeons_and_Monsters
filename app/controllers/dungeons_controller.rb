class DungeonsController < ApplicationController
  def index
    @dungeons = Dungeon.sort_by_most_recently_created
  end

  def show
    @dungeon = Dungeon.find(params[:id])
  end

  def new
  end

  def create
    Dungeon.create(dungeon_params)
    redirect_to '/dungeons'
  end

  private

  def dungeon_params
    params.permit(:name, :kind, :hold, :cleared, :visit_count)
  end
end