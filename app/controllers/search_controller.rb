class SearchController < ApplicationController
  def index
    @query = params[:query]
    @category = params[:category]

    @results = if @query.present?
                 case @category
                 when 'Race'
                   Race.where("name LIKE ?", "%#{@query}%")
                 when 'Class'
                   PlayerClass.where("name LIKE ?", "%#{@query}%")
                 when 'Specialization'
                   Specialization.where("name LIKE ?", "%#{@query}%")
                 when 'Hero'
                   Hero.where("name LIKE ?", "%#{@query}%")
                 else
                   global_search
                 end
               else
                 []
               end
  end

  private

  def global_search
    races = Race.where("name LIKE ?", "%#{@query}%")
    classes = PlayerClass.where("name LIKE ?", "%#{@query}%")
    specializations = Specialization.where("name LIKE ?", "%#{@query}%")
    heroes = Hero.where("name LIKE ?", "%#{@query}%")

    races + classes + specializations + heroes
  end
end
