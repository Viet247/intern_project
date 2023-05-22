class Job < ApplicationRecord
    belongs_to :industry
    belongs_to :city

    searchable do
      text :benefit, stored: true, boost: 73
      text :category_value, stored: true, boost: 77 do |v|
        v.industry.title
      end
      text :description, stored: true, boost: 74
      text :name, stored: true, boost: 92  
      text :requirements, stored: true, boost: 68 
      text :work_place, stored: true, boost: 86 do |v|
        v.city.name
      end
      text :company_name, stored: true, boost: 80
      integer :id, stored: true
    end
end



