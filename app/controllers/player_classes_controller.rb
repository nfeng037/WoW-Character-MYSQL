class PlayerClassesController < ApplicationController
  def index
    @player_classes = PlayerClass.page(params[:page]).per(8)
  end

  def show
    @player_class = PlayerClass.includes(:specializations).find(params[:id])
  end
end
