class Post < ApplicationRecord
  EMPLOYMENT_TYPES = %w(Full-time Part-time Contract)
  EDUCATION_LEVELS = %w(PHD Master Bachalor Diploma A-levels ITE O-levels)
  EXPECTED_SALARIES = %w(100-1000 1000-2000 2000-3000 4000-5000 >5000 >8000 >10000)
  INDUSTRIES = ['Health Care', 'Finance', 'Technology', 'Manufacturing', 'HR', 'Education']
  WORK_EXPERIENCES = %w(0 1-3 4-6 7-10 >10)

  belongs_to :company
  has_many :status, :dependent => :delete_all
  has_many :message, :dependent => :delete_all


  validates :job_title, length: { minimum: 3, maximum: 50 }
  validates :job_description, length: { minimum: 3, maximum: 1000 }

end