class PostsController < ApplicationController

  before_action :authenticate_company!

  def index
    @post = Post.find_by(id: params[:id])

    # ================================================================
    # if there is no such post, redirect them
    # if they are trying to access a different company's post discover page, redirect them
    if (@post === nil)
      redirect_to root_path
    else

      unless (@post.company_id === current_company.id)
        redirect_to root_path
      end
    # ================================================================
    @statuses = Status.where(post_id: @post).where.not(post_approval: "pending").pluck(:user_id)
    @users = User.where(industry: @post.industry, employment_type: @post.employment_type).where.not(id: @statuses)
    @user = @users.first

    end

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

    # ================================================================
    # if there is no such post, redirect them
    # if they are trying to access a different company's post discover page, redirect them
    if (@post === nil)
      redirect_to root_path
    else

      unless (@post.company_id === current_company.id)
        redirect_to root_path
      end

    end
    # ================================================================

  end

  def edit
    @post = Post.find_by(id: params[:id])

    # ================================================================
    # if there is no such post, redirect them
    # if they are trying to access a different company's post discover page, redirect them
    if (@post === nil)
      redirect_to root_path
    else

      unless (@post.company_id === current_company.id)
        redirect_to root_path
      end

    end
    # ================================================================

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