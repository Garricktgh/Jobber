class Post < ApplicationRecord
  has_many :status
  has_many :message

  validates :job_title, length: { minimum: 3, maximum: 50 }
  validates :job_description, length: { minimum: 3, maximum: 300 }
end