class User < ApplicationRecord
  has_many :applies
  has_many :jobs, through: :applies
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  mount_uploader :curriculum_vitate, CurriculumVitateUploader
end


