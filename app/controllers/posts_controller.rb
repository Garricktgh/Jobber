class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(compnay_params)

    if(@post.save)
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @users = User.where(work_experience: @post.work_experience, industry: @post.industry, education_level: @post.education_level, employment_type: @post.employment_type, expected_salary: @post.expected_salary)
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(post_params)
    redirect_to root_path
  end

  def destroy

  end
  
  private
  def post_params
    params.require(:post).permit(:job_title, :job_description, :employment_type, :industry, :work_experience, :education_level, :expected_salary)
  end
end
