class MessagesController < ApplicationController

  def index
    if (user_signed_in?)
      @user = current_user
      @matches = Status.where(user_id: @user.id, post_approval: "accept", user_approval: "accept")
      @messages = Message.select('DISTINCT ON ("post_id") *').order(:post_id, created_at: :desc, id: :desc).where(user_id: current_user)
    elsif (company_signed_in?)
      @company = current_company
      @post = Post.where(company_id: current_company.id)
      @matches = Status.where(post_id: [@post.ids], post_approval: "accept", user_approval: "accept")
      @messages = Message.select('DISTINCT ON ("post_id") *').order(:post_id, created_at: :desc, id: :desc).where(post_id: [@post.ids])
    else
      redirect_to root_path
    end

  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if(@message.save)
      redirect_to message_path
    else
      redirect_to message_path
    end
  end

  def show
    @messages = Message.where(user_id: message_params[:user_id], post_id: message_params[:post_id]).order(created_at: :desc)
  end

  def edit

  end

  def update
    # @message = Message.find_by(user_id: message_params[:user_id]. post_id: message_params[:post_id])
    # @message.update(message_params)
    # redirect_to root_path
  end

  def destroy

  end

  private
  def message_params
    params.require(:message).permit(:post_id, :user_id, :sender, :content)
  end
end