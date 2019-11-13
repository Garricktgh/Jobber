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
  User.create!(email: "user@email.com", password: password, name: FFaker::Name.first_name, display_picture: FFaker::Image.url, employment_type: "Full-time", industry: "Finance", work_experience: "0 years", education_level: "Bachelor", expected_salary: "$100-1k")

  User.create!(email: "user1@email.com", password: password, name: FFaker::Name.first_name, display_picture: FFaker::Image.url, employment_type: "Contract", industry: "Finance", work_experience: "4-5 years", education_level: "Master", expected_salary: "$100-1k")

  User.create!(email: "user2@email.com", password: password, name: FFaker::Name.first_name, display_picture: FFaker::Image.url, employment_type: "Part-time", industry: "Technology", work_experience: "1-3 years", education_level: "Master", expected_salary: "$1k-2k")

  User.create!(email: "user3@email.com", password: password, name: FFaker::Name.first_name, display_picture: FFaker::Image.url, employment_type: "Full-time", industry: "HR", work_experience: "1-3 years", education_level: "Bachelor", expected_salary: "$2k-3k")

  User.create!(email: "user4@email.com", password: password, name: FFaker::Name.first_name, display_picture: FFaker::Image.url, employment_type: "Full-time", industry: "Finance", work_experience: "4-5", education_level: "Bachelor", expected_salary: "$1k-2k")

  User.create!(email: "user5@email.com", password: password, name: FFaker::Name.first_name, display_picture: FFaker::Image.url, employment_type: "Full-time", industry: "Finance", work_experience: "0 years", education_level: "Bachelor", expected_salary: "$100-1k")

  User.create!(email: "user6@email.com", password: password, name: FFaker::Name.first_name, display_picture: FFaker::Image.url, employment_type: "Full-time", industry: "Finance", work_experience: "0 years", education_level: "Bachelor", expected_salary: "$100-1k")

  User.create!(email: "user7@email.com", password: password, name: FFaker::Name.first_name, display_picture: FFaker::Image.url, employment_type: "Full-time", industry: "Finance", work_experience: "0 years", education_level: "Bachelor", expected_salary: "$100-1k")

  User.create!(email: "user8@email.com", password: password, name: FFaker::Name.first_name, display_picture: FFaker::Image.url, employment_type: "Full-time", industry: "Finance", work_experience: "0 years", education_level: "Bachelor", expected_salary: "$100-1k")
  
  User.create!(email: "user9@email.com", password: password, name: FFaker::Name.first_name, display_picture: FFaker::Image.url, employment_type: "Full-time", industry: "Finance", work_experience: "0 years", education_level: "Bachelor", expected_salary: "$100-1k")
  
  User.create!(email: "user10@email.com", password: password, name: FFaker::Name.first_name, display_picture: FFaker::Image.url, employment_type: "Full-time", industry: "Finance", work_experience: "0 years", education_level: "Bachelor", expected_salary: "$100-1k")

  Company.create!(email: "company@email.com", password: password, display_picture: FFaker::Image.url, name: FFaker::InternetSE.company_name_single_word )

  10.times do
    Post.create!(company_id: 1, job_title: FFaker::Job.title,  job_description: FFaker::AWS.product_description, employment_type: "Full-time", industry: "Finance", work_experience: "0 years", education_level: "Bachelor", expected_salary: "$100-1k")

    Post.create!(company_id: 1, job_title: FFaker::Job.title,  job_description: FFaker::AWS.product_description, employment_type: "Full-time", industry: "HR", work_experience: "4-5 years", education_level: "Bachelor", expected_salary: "$2k-3k")

    Post.create!(company_id: 1, job_title: FFaker::Job.title,  job_description: FFaker::AWS.product_description, employment_type: "Full-time", industry: "Tech", work_experience: "1-3 years", education_level: "Master", expected_salary: "$2k-3k")
  end

  Status.create!(post_id: 1, user_id: 1, user_approval: "approved")
  Status.create!(post_id: 2, user_id: 1, user_approval: "approved")
  Status.create!(post_id: 3, user_id: 1, user_approval: "approved")
  Status.create!(post_id: 4, user_id: 1, user_approval: "approved")

  Status.create!(post_id: 4, user_id: 2, post_approval: "approved")
  Status.create!(post_id: 5, user_id: 3, post_approval: "approved")
  Status.create!(post_id: 6, user_id: 4, post_approval: "approved")
  Status.create!(post_id: 7, user_id: 5, post_approval: "approved")
  
end