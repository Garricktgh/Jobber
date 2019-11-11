class CompaniesController < ApplicationController
  def index
    @companys = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(compnay_params)

    if(@company.save)
      redirect_to @company
    else
      render 'new'
    end
  end

  def show
    
  end

  def edit

  end

  def update
  
  end

  def destroy

  end
  
  private
  def company_params
    params.require(:company).permit()
  end

end
