class MessagesController < ApplicationController
  def index
    @matches = Status.where(user_approval: "accept", post_approval: "accept")
    if current_user?
      @messages = messages.where()
    
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if(@message.save)
      redirect_to @message
    else
      render 'new'
    end
  end

  def show
    @message = Message.find_by(id: params[:id])
  end

  def edit
    @message = Message.find_by(id: params[:id])
  end

  def update
    @message = Message.find_by(id: params[:id])
    @message.update(message_params)
    redirect_to root_path
  end

  def destroy

  end
  
  private
  def message_params
    params.require(:message).permit(:content)
  end
end
