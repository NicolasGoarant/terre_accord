module Api
  class CountriesController < ApplicationController
    def index
      @countries = Country.all
      render json: @countries.as_json(only: [:id, :name, :code, :score_letter_rating, :description, :ccpi_score])
    end
  end
end