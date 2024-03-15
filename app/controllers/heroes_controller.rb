class HeroesController < ApplicationController
  def index
    @heroes = Hero.page(params[:page]).per(8)
  end

  def show
    @hero = Hero.find(params[:id])
  end
end
