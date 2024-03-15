class RacesController < ApplicationController
  def index
    @races = Race.paginate(page:params[:page],per_page:4)
  end

  def show
    @race = Race.find(params[:id])
  end

  def about
  end

  def faction
    @faction = params[:faction]
    @races = Race.where(faction: @faction.capitalize)
  end
end
