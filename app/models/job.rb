class Job < ApplicationRecord
  belongs_to :user
  has_many :contracts
  has_many :workers, through: :contracts, source: :user 
  has_many :wants, dependent: :destroy
  has_many :applicants, through: :wants, source: :user
  
  
end
