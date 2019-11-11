class PostsController < ApplicationController
  def index
    @posts = Post.all
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
