class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @statuses = Status.where(user_id: @user).where.not(user_approval: "pending").pluck(:post_id)
    @posts = Post.where(industry: @user.industry, employment_type: @user.employment_type).where.not(id: @statuses)
    @post = @posts.first
    if (@post)
      @company = Company.where(id: @post.company_id).first
    end
  end

  def new

  end

  def create

  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])


    if (user_params[:display_picture].is_a?(String))

      @user.update(user_params)
      redirect_to user_path

    else

      uploaded_file = user_params[:display_picture].path
      cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)

      @user.update(user_params)
      @user.display_picture = cloudnary_file["url"]
      @user.save

      redirect_to user_path

    end


  end

  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:name, :display_picture, :employment_type, :industry, :work_experience, :education_level, :expected_salary, :description)
  end
end