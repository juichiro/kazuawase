class Contract < ApplicationRecord
  belongs_to :user
  belongs_to :job
  belongs_to :employer, class_name: 'User'
end
