desc "Import jobs from csv file"
task :import => [:environment] do
  jobs = []
  industries = []
  cities = []
  file = "db/jobs.csv"

  CSV.foreach(file, :headers => true) do |row|
    # byebug
    industries << Industry.new(category: row[1])
    # cities << City.new(work_place: row[16])
  end
  Industry.import industries, on_duplicate_key_ignore: true
  # City.import cities, on_duplicate_ignore: true
  ids_of_industry = Industry.pluck(:category, :id).to_h
  CSV.foreach(file, :headers => true) do |row|
    jobs << Job.new(
      benefit: row[0],
      # industries_id
      industries_id: ids_of_industry[row[1]]
     
      # company_address: row[2],
      # company_district: row[3],
      # company_id: row[4],
      # company_name: row[5],
      # company_province: row[6],
      # description: row[7],
      # level: row[8],
      # name: row[9],
      # requirements: row[10],
      # salary: row[11],
      # type_work: row[12],
      # contact_email: row[13],
      # contact_name: row[14],
      # contact_phone: row[15] # work_place_id
      )
  end
  byebug
  Job.import jobs
end


