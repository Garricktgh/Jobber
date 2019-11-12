class UsersController < ApplicationController

  before_action :authenticate_user!


  def index
    @User = current_user
    @statuses = Status.all.pluck(:post_id)
    @posts = Post.where(work_experience: @User.work_experience, industry: @User.industry, education_level: @User.education_level, employment_type: @User.employment_type, expected_salary: @User.expected_salary)..where.not(id: @statuses)
    # Post.where(work_experience: User.work_experience, industry: User.industry, education_level: User.education_level, employment_type: User.employment_type, expected_salary: User.expected_salary).where.not(id: Statuses.post_id)
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