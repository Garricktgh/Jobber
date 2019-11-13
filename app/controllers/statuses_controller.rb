class StatusesController < ApplicationController
  def create
    @status = Status.find_or_initialize_by(post_id: status_params[:post_id], user_id: status_params[:user_id])
    p status_params
    p params[:post_id]
    p params[:post_approval]
    if params[:post_approval].present?
      @status.update_attributes(post_approval: params[:post_approval])
      @status.save
      redirect_to post_suggestions(params[:post_id])
    elsif params[:user_approval].present?
      @status.update_attributes(user_approval: params[:user_approval])
      @status.save
      redirect_to users
    end
  end

  private
  def status_params
    params.require(:status).permit(:post_id, :user_id, :post_approval, :user_approval)
  end

end