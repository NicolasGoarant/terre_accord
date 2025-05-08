class CountriesController < ApplicationController
  # Page principale de liste des pays avec filtres
  def index
    # Initialisation de la requête de base
    @countries = Country.all.order(:name)
    
    # Filtrage par continent
    if params[:continent].present?
      @countries = @countries.where(continent: params[:continent])
    end
    
    # Filtrage par score climatique
    if params[:score].present? && params[:score].any?
      @countries = @countries.where(score_letter_rating: params[:score])
    end
    
    # Filtrage par activité
    if params[:activity].present?
      activity = Activity.find_by(name: params[:activity])
      if activity
        @countries = @countries.joins(:activities).where(activities: { id: activity.id }).distinct
      end
    end
  end

  # Page détaillée d'un pays
  def show
    @country = Country.includes(:activities, :embassy, :affiliate_links).find(params[:id])
    @petition_count = @country.petition_signatures.count
  rescue ActiveRecord::RecordNotFound
    redirect_to '/not-found'
  end
  
  # API pour la carte interactive
  def api_index
    @countries = Country.all.select(:id, :name, :code, :continent, :score_letter_rating, :description, :image_url, :ccpi_score)
    render json: @countries
  end

  private
  
  # Méthode helper pour récupérer les couleurs en fonction des scores
  helper_method :score_color
  def score_color(score)
    case score
    when 'A' then '#15803d' # vert foncé
    when 'B' then '#16a34a' # vert
    when 'C' then '#4ade80' # vert clair
    when 'D' then '#fcd34d' # jaune
    when 'E' then '#f59e0b' # orange
    when 'F' then '#f97316' # orange foncé
    when 'G' then '#ef4444' # rouge
    else '#9ca3af' # gris par défaut
    end
  end
end
