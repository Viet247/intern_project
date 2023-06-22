class Apply < ApplicationRecord
    belongs_to :job
    belongs_to :user
    belongs_to :city 
    belongs_to :industry

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP}
  validates :full_name, presence: true, length: { maximum: 200 }

  def self.ransackable_attributes(auth_object = nil)
    ["email", "created_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["city", "industry"]
  end
end
