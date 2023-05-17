# require "activerecord-import/base"
# ActiveRecord::Import.require_adapter("mysql2")
class Job < ApplicationRecord
    belongs_to :industry
    belongs_to :city
    searchable do
      text :benefit, :category, :description, :name, :requirement, :work_place
      text :company_address, :company_district, :company_name, :company_province
    end
end
/config/routes.rb
