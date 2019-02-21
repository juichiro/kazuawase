class User < ApplicationRecord
     before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :jobs
  has_many :contracts, class_name: 'Contract', foreign_key: 'employer_id'
  has_many :myjobs, through: :contracts, source: :job#結局これは契約された状態にある、自分が募集した仕事を表示しているだけ
  has_many :wants, dependent: :destroy
  has_many :wanttodolists, through: :wants, source: :job
  has_many :contractsasworkers, class_name: 'Contract', foreign_key: 'user_id'
  has_many :jobsasworkers, through: :contractsasworkers, source: :job
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
 def approve(user, job)
   self.contracts.find_or_create_by(user_id: user.id, job_id: job.id)
 end 
 def disapprove(user, job)
     contract = self.contracts.find_by(user_id: user.id, job_id: job.id)
     contract.destroy if contract
 end 
   
 
 # def approve(want)
  #  self.contracts.find_or_create_by(user_id: want.user.id, job_id: want.job.id)
  #end
  
  
end
