class City < ApplicationRecord
  has_many :jobs
  scope :all_cities_vn, ->{ where country: "Việt Nam" }
  scope :all_cities_int, ->{ where country: "Khác" }
end
