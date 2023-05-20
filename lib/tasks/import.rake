desc "Import jobs from csv file"
task :import => [:environment] do
  jobs = []
  industries = []
  cities = []
  file = "db/jobs.csv"
  # get country
  viet_nam = ISO3166::Country.new('VN')
  #get cities or provinces
  cities_of_vietnam = viet_nam.subdivision_names_with_codes('vi').map{|c| c[0]}
  
  CSV.foreach(file, :headers => true) do |row|
    industries << Industry.new(category: row[1])
    cities << City.new(city_name: row[16].delete(']"['))
  end

  Industry.import industries, on_duplicate_key_ignore: true
  City.import cities, on_duplicate_key_ignore: true

  ids_of_industries = Industry.pluck(:category, :id).to_h
  ids_of_cities = City.pluck(:city_name, :id).to_h
  byebug
 

  #import data for jobs
  CSV.foreach(file, :headers => true) do |row|
    jobs << Job.new(
      benefit: row[0],
      industries_id: ids_of_industries[row[1]],
      company_address: row[2],
      company_district: row[3],
      company_id: row[4],
      company_name: row[5],
      company_province: row[6],
      description: row[7],
      level: row[8],
      name: row[9],
      requirements: row[10],
      salary: row[11],
      type_work: row[12],
      contact_email: row[13],
      contact_name: row[14],
      contact_phone: row[15], 
      cities_id: ids_of_cities[row[16].delete(']"[')]
      )
  end
  Job.import jobs, on_duplicate_key_update: [:benefit, :industries_id, :company_address, :company_district, :company_id, :company_name, :company_province, :description, :level, :name, :requirements, :salary, :type_work, :contact_email, :contact_name, :contact_phone, :cities_id]
end




