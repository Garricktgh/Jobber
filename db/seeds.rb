# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
include FFaker

ActiveRecord::Base.transaction do
  password = "123123"
  User.create!(email: "user@email.com", password: password, name: FFaker::Name.first_name, display_picture: FFaker::Image.url, employment_type: "Full-time", industry: "Finance", work_experience: "0", education_level: "Bachalor", expected_salary: "100-1000")

  User.create!(email: "user1@email.com", password: password, name: FFaker::Name.first_name, display_picture: FFaker::Image.url, employment_type: "Contract", industry: "Finance", work_experience: "4-5", education_level: "Master", expected_salary: "100-1000")

  User.create!(email: "user2@email.com", password: password, name: FFaker::Name.first_name, display_picture: FFaker::Image.url, employment_type: "Part-time", industry: "Technology", work_experience: "1-3", education_level: "Master", expected_salary: "1000-2000")

  User.create!(email: "user3@email.com", password: password, name: FFaker::Name.first_name, display_picture: FFaker::Image.url, employment_type: "Full-time", industry: "HR", work_experience: "1-3", education_level: "Bachalor", expected_salary: "2000-3000")

  User.create!(email: "user4@email.com", password: password, name: FFaker::Name.first_name, display_picture: FFaker::Image.url, employment_type: "Full-time", industry: "Finance", work_experience: "4-5", education_level: "Bachalor", expected_salary: "1000-2000")

  Company.create!(email: "company@email.com", password: password, display_picture: FFaker::Image.url, name: FFaker::InternetSE.company_name_single_word )

  10.times do
    Post.create!(company_id: 1, job_title: FFaker::Job.title,  job_description: FFaker::AWS.product_description, employment_type: "Full-time", industry: "Finance", work_experience: "0", education_level: "Bachalor", expected_salary: "100-1000")

    Post.create!(company_id: 1, job_title: FFaker::Job.title,  job_description: FFaker::AWS.product_description, employment_type: "Full-time", industry: "HR", work_experience: "4-5", education_level: "Bachalor", expected_salary: "2000-3000")

    Post.create!(company_id: 1, job_title: FFaker::Job.title,  job_description: FFaker::AWS.product_description, employment_type: "Full-time", industry: "Tech", work_experience: "1-3", education_level: "Master", expected_salary: "2000-3000")
  end
end