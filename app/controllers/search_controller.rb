class SearchController < ApplicationController
  def index
    @query = params[:query]
    @category = params[:category]

    if @query.present?
      if @category.present?
        @results = search_by_category(@category.downcase.pluralize, @query)
      else
        @results = global_search(@query)
      end
    else
      @results = {}
    end
  end

  private

  def search_by_category(category, query)
    case category
    when 'races'
      { races: Race.where("name LIKE ?", "%#{query}%") }
    when 'player_classes'
      { player_classes: PlayerClass.where("name LIKE ?", "%#{query}%") }
    when 'specializations'
      { specializations: Specialization.where("name LIKE ?", "%#{query}%") }
    when 'heroes'
      { heroes: Hero.where("name LIKE ?", "%#{query}%") }
    else
      {}
    end
  end

  def global_search(query)
    results = {}
    results[:races] = Race.where("name LIKE ?", "%#{query}%")
    results[:player_classes] = PlayerClass.where("name LIKE ?", "%#{query}%")
    results[:specializations] = Specialization.where("name LIKE ?", "%#{query}%")
    results[:heroes] = Hero.where("name LIKE ?", "%#{query}%")
    results
  end
end
