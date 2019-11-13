class LandingPageController < ApplicationController
  def index

    if(company_signed_in?)
      @company = current_company
      redirect_to @company
    elsif (user_signed_in?)
      @user = current_user
      redirect_to @user
    end

  end
end