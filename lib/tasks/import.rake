desc "Import jobs from csv file"
task :import => [:environment] do
  file = "db/jobs.csv"
  # file có thể ở dạng file hoặc là path của file 
  spreadsheet = Roo::Spreadsheet.open file
  # lấy cột header (column name)
  header = spreadsheet.row(1)
  byebug
  rows = []
    (2..spreadsheet.last_row).each do |i|
      rows << spreadsheet.row(i)
    end 
  Job.import! header, rows
end

