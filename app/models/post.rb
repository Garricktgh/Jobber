class Post < ApplicationRecord
  belongs_to :company

  has_many :status, :dependent => :delete_all
  has_many :message, :dependent => :delete_all

  validates :job_title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :job_description, presence: true, length: { minimum: 3, maximum: 300 }
end