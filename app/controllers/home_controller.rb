class HomeController < ApplicationController
  def index
    # Récupérer les pays les mieux notés pour la page d'accueil
    @top_countries = Country.order(climate_score: :desc).limit(3)
  end
end