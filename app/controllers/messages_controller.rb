class MessagesController < ApplicationController

  def index

    @messages = Message.where()

    if (user_signed_in?)
      @user = current_user
      @matches = Status.where(user_id: @user.id, post_approval: "approved", user_approval: "approved")
      @messages = Message.select('DISTINCT ON ("post_id") *').order(:post_id, created_at: :desc, id: :desc).where(user_id: current_user)
    elsif (company_signed_in?)
      @company = current_company
      @post = Post.where(company_id: current_company.id)
      @matches = Status.where(post_id: [@post.ids], post_approval: "approved", user_approval: "approved")
      @messages = Message.select('DISTINCT ON ("user_id") *').order(:user_id, created_at: :desc, id: :desc).where(post_id: [@post.ids])
    end

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