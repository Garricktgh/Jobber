class SuggestionsController < ApplicationController

  before_action :authenticate_company!

  def index
    @post = Post.find_by(id: params[:post_id])
    @statuses = Status.where(post_id: @post).where.not(post_approval: "pending").pluck(:user_id)
    @users = User.where(industry: @post.industry, employment_type: @post.employment_type).where.not(id: @statuses)
    @user = @users.first
  end

end