class MessagesController < ApplicationController
  def index
    # if user_sign_in?
    #   @matches = Status.where(user_id: current_user, user_approval: "accept", post_approval: "accept")
    #   @messages = Message.select('DISTINCT ON ("post_id") *').order(:post_id, created_at: :desc, id: :desc).where(user_id: current_user)
    # elsif company_sign_in?
    #   @matches = Status.where(post_id: current_user, user_approval: "accept", post_approval: "accept")
    # end
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
    @message = Message.find_by(user_id: message_params[:user_id]. post_id: message_params[:post_id])
  end

  def update
    @message = Message.find_by(user_id: message_params[:user_id]. post_id: message_params[:post_id])
    @message.update(message_params)
    redirect_to root_path
  end

  def destroy

  end
  
  private
  def message_params
    params.require(:message).permit(:post_id, :user_id, :sender, :content)
  end
end
