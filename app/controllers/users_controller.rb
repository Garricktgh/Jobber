class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @statuses = Status.where(user_id: @user).where.not(user_approval: "pending").pluck(:post_id)
    @posts = Post.where(work_experience: @user.work_experience, industry: @user.industry, education_level: @user.education_level, employment_type: @user.employment_type, expected_salary: @user.expected_salary).where.not(id: @statuses)
    @post = @posts.first
    if (@post)
      @company = Company.where(id: @post.company_id).first
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(company_params)

    if(@user.save)
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:name, :display_picture, :employment_type, :industry, :work_experience, :education_level, :expected_salary, :description)
  end
end