class Industry < ApplicationRecord
  has_many :jobs
  scope :all_industries, -> { where('job_count > ?', '1') }
end
