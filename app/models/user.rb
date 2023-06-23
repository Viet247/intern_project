class User < ApplicationRecord
  has_many :applies
  has_many :jobs, through: :applies
  has_many :favourites
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  mount_uploader :curriculum_vitate, CurriculumVitateUploader

  def is_admin?
    is_admin
  end
end


