class HeroesController < ApplicationController
  def index
    @heroes = Hero.paginate(page:params[:page],per_page:8)
  end

  def show
    @hero = Hero.find(params[:id])
  end
end
