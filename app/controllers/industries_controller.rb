class IndustriesController < ApplicationController
  # get result for city list 
  def index
    @industries = Industry.all_industries
    
  end
end
