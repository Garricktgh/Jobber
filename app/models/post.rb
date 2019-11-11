class Post < ApplicationRecord
  belongs_to :company

  has_many :status, :dependent => :delete_all
  has_many :message, :dependent => :delete_all

  validates :job_title, length: { minimum: 3, maximum: 50 }
  validates :job_description, length: { minimum: 3, maximum: 300 }
end