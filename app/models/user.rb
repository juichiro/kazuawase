class User < ApplicationRecord
     before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :jobs
  has_many :contracts
  has_many :myjobs, through: :contracts, source: :job
  has_many :wants, dependent: :destroy
  has_many :wanttodolists, through: :wants, source: :job
  
  def apply(job)
      self.wants.find_or_create_by(job_id: job.id)
  end

  def withdraw(job)
    want = self.wants.find_by(job_id: job.id)
    want.destroy if want
  end

  def apply?(job)
    self.wanttodolists.include?(job)
  end
end
