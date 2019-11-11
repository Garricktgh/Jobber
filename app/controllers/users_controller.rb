class UsersController < ApplicationController
  def index
    @User = current_user
    @posts = Post.where(work_experience: @User.work_experience, industry: @User.industry, education_level: @User.education_level, employment_type: @User.employment_type, expected_salary: @User.expected_salary)
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
    redirect_to root_path
  end

  def destroy

  end
  
  private
  def user_params
    params.require(:user).permit(:job_title, :job_description, :employment_type, :industry, :work_experience, :education_level, :expected_salary)
  end
end
