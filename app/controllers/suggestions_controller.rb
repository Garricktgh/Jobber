class SuggestionsController < ApplicationController
  def index
<<<<<<< Updated upstream
    @post = Post.find(params[:post_id])
=======
    @post = Post.find_by(id: params[:post_id])
<<<<<<< HEAD
=======
>>>>>>> Stashed changes
>>>>>>> master
    @statuses = Status.where(post_id: @post).where.not(post_approval: "pending").pluck(:user_id)
    @users = User.where(work_experience: @post.work_experience, industry: @post.industry, education_level: @post.education_level, employment_type: @post.employment_type, expected_salary: @post.expected_salary).where.not(id: @statuses)
    @user = @users.first
  end
  
end