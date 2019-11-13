class PostsController < ApplicationController
  before_action :authenticate_company!
  
  def index

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