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
    @company = Company.find_by(id: params[:id])
  end

  def edit
    @company = Company.find_by(id: params[:id])
  end

  def update
    @company = Company.find_by(id: params[:id])
    @company.update(company_params)
    redirect_to root_path
  end

  def destroy

  end
  
  private
  def company_params
    params.require(:company).permit(:email)
  end

end

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
    @company = Company.find_by(id: params[:id])
  end

  def edit
    @company = Company.find_by(id: params[:id])
  end

  def update
    @company = Company.find_by(id: params[:id])
    @company.update(company_params)
    redirect_to root_path
  end

  def destroy

  end
  
  private
  def company_params
    params.require(:company).permit(:email)
  end

end