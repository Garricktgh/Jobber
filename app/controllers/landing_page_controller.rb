class LandingPageController < ApplicationController
  def index

    if company_signed_in?
      @company = current_company
      @post = Post.find_by(company_id: @company)
      if @post.nil?
        redirect_to edit_company_path(@company)
      else
        redirect_to @company
      end
    elsif user_signed_in?
      @user = current_user
      if @user.employment_type.nil? || @user.industry.nil? || @user.education_level.nil? || @user.expected_salary.nil? || @user.work_experience.nil?
        redirect_to edit_user_path(@user)
      else
        redirect_to users_path
      end
    end

  end
end