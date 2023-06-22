class Industry < ApplicationRecord
  has_many :jobs
  scope :all_industries, -> { where('job_count > ?', '1') }

  def self.ransackable_attributes(auth_object = nil)
    ["id"]
  end
end
