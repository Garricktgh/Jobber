class Post < ApplicationRecord
  EMPLOYMENT_TYPES = %w(Full-time Part-time Contract)
  EDUCATION_LEVELS = %w(PHD Master Bachelor Diploma A-levels ITE O-levels)
  EXPECTED_SALARIES = %w($100-1k $1k-2k $2k-3k $4k-5k >$5k >$8k >$10k)
  INDUSTRIES = ['Health Care', 'Finance', 'Technology', 'Manufacturing', 'HR', 'Education']
  WORK_EXPERIENCES = ["0 years", "1-3 years", "4-6 years", "7-10 years", ">10 years"]

  belongs_to :company
  has_many :status, :dependent => :delete_all
  has_many :message, :dependent => :delete_all

  validates :job_title, length: { minimum: 3, maximum: 50 }
  validates :job_description, length: { minimum: 3, maximum: 1000 }

end