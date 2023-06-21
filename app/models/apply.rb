class Apply < ApplicationRecord
    belongs_to :job
    belongs_to :user

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP}
  validates :full_name, presence: true, length: { maximum: 200 }
end
