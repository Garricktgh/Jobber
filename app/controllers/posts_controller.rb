class PostsController < ApplicationController

  before_action :authenticate_company!


  def index


    @company = current_company
    @post = Post.find_by(id: params[:id])
    @statuses = Status.where(post_id: @post).pluck(:user_id)
    @user = User.where(work_experience: @post.work_experience, industry: @post.industry, education_level: @post.education_level, employment_type: @post.employment_type, expected_salary: @post.expected_salary).where.not(id: @statuses)


  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.company = current_company

    if(@post.save)
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    # @post = Post.find_by(id: params[:id])
    # @users = User.where(work_experience: @post.work_experience, industry: @post.industry, education_level: @post.education_level, employment_type: @post.employment_type, expected_salary: @post.expected_salary)

    @post = Post.find_by(id: params[:id])
    @company = current_company


  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(post_params)
    redirect_to post_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @company = current_company

    redirect_to company_path(@company)
  end

  private
  def post_params
    params.require(:post).permit(:job_title, :job_description, :employment_type, :industry, :work_experience, :education_level, :expected_salary)
  end
end