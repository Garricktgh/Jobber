class CompaniesController < ApplicationController
  def index
    @user = current_user
    @statuses = Status..where(user_id: @user).pluck(:post_id)
    @posts = Post.where(work_experience: @user.work_experience, industry: @user.industry, education_level: @user.education_level, employment_type: @user.employment_type, expected_salary: @user.expected_salary).where.not(id: @statuses)
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if(@company.save)
      redirect_to @company
    else
      render 'new'
    end
  end

  def show
    @company = Company.find_by(id: params[:id])
    @post = @company.post
  end

  def edit
    @company = Company.find_by(id: params[:id])
  end

  def update
    @company = Company.find_by(id: params[:id])
    @company.update(company_params)
    redirect_to company_path
  end

  def destroy

  end

  private
  def company_params
    params.require(:company).permit(:name, :display_picture)
  end

end