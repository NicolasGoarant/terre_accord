class CountriesController < ApplicationController
  def index
    @countries = Country.all
    
    # Filtrer par continent
    if params[:continent].present?
      @countries = @countries.where(continent: params[:continent])
    end
    
    # Filtrer par score climatique
    if params[:score].present? && params[:score].is_a?(Array)
      @countries = @countries.where(score_letter_rating: params[:score])
    end
    
    # Filtrer par activité
    if params[:activity].present?
      activity = Activity.find_by(name: params[:activity])
      if activity
        country_ids = CountryActivity.where(activity_id: activity.id).pluck(:country_id)
        @countries = @countries.where(id: country_ids)
      end
    end
    
    # Tri par défaut
    @countries = @countries.order(:score_letter_rating)
  end
  
  def show
    @country = Country.find(params[:id])
    @activities = @country.activities
  end
end
