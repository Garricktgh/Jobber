class SuggestionsController < ApplicationController
  def index
    @post = Post.find_by(id: params[:post_id])
    @statuses = Status.where(post_id: @post).pluck(:user_id)
    @users = User.where(work_experience: @post.work_experience, industry: @post.industry, education_level: @post.education_level, employment_type: @post.employment_type, expected_salary: @post.expected_salary).where.not(id: @statuses)
    @user = @users.first
  end


end