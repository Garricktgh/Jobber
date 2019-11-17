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


    if (user_signed_in?)
      @messages = Message.where(user_id: params[:user_id], post_id: params[:post_id]).order(created_at: :asc)
      @user = User.find_by(id: params[:user_id])
      # ================================================================
      # if user don't exits, redirect them
      # if they are trying to access a different user's chat page, redirect them
      # if post and user haven't matched, redirect them
      if (@user == nil)
        redirect_to root_path
      else
        unless (@user.id === current_user.id)
          redirect_to root_path
        end
        @post = Post.find_by(id: params[:post_id])
        @status = Status.where(user_id: params[:user_id], post_id: params[:post_id], post_approval: "accept", user_approval: "accept").first
        if (@status == nil)
          redirect_to root_path
        end
      end
      # ================================================================


    elsif (company_signed_in?)
      @messages = Message.where(user_id: params[:user_id], post_id: params[:post_id]).order(created_at: :asc)
      @user = User.find_by(id: params[:user_id])
      @post = Post.find_by(id: params[:post_id])
      # ================================================================
      # if post don't exists, redirect them
      # if they are trying to access a different company's post's chat page, redirect them
      # if post and user haven't matched, redirect them
      if (@post == nil)
        redirect_to root_path
      else
        if (@post.company_id != current_company.id)
          redirect_to root_path
        else
          @status = Status.where(user_id: params[:user_id], post_id: params[:post_id], post_approval: "accept", user_approval: "accept").first
          if (@status == nil)
            redirect_to root_path
          end
        end
      end
      # ================================================================


    else
      redirect_to root_path
    end


  end

  def create
    @message = Message.new(message_params)

    if (company_signed_in?)
      @message.sender = "post"
    elsif user_signed_in?
      @message.sender = "user"
    end

    @message.save
    redirect_to new_message_path(post_id: message_params[:post_id], user_id: message_params[:user_id])
  end


  private
  def message_params
    params.require(:message).permit(:post_id, :user_id, :sender, :content)
  end
end