class StatusController < ApplicationController
  def create
    @status = Status.find_or_initialize_by(post_id: params[:post_id], user_id: params[:user_id])
    if params[:post_approval].present?
      @status.update_attributes(post_approval: params[:post_approval])
    elsif params[:user_approval].present?
      @status.update_attributes(user_approval: params[:user_approval])
    end
    @status.save
  end
end
