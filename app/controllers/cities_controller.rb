class CitiesController < ApplicationController
  # get result for city list 
  def index
    @cities_vn = City.all_cities_vn
    @cities_int = City.all_cities_int
  end
end
