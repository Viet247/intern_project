# require "activerecord-import/base"
# ActiveRecord::Import.require_adapter("mysql2")
class Job < ApplicationRecord
    belongs_to :industry
    belongs_to :city

    searchable do
      text :benefit, stored: true, boost: 73
      text :category_value, stored: true, boost: 77 do |priority|
        priority.Industry.category
      end
      text :description, stored: true, boost: 74
      text :name, stored: true, boost: 92  
      text :requirement, stored: true, boost: 68 
      text :work_place, stored: true, boost: 86 do |priority|
        priority.City.city_name
      end
      text :company_name, stored: true, boost: 80
    end
end

