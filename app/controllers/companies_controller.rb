class CompaniesController < ApplicationController
  def index
    @companies = Company.where()
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if(@company.save)
      redirect_to @company
    else
      render 'new'
    end
  end

  def show
    @company = Company.find_by(id: params[:id])
    @post = @company.post
  end

  def edit
    @company = Company.find_by(id: params[:id])
  end

  def update
    @company = Company.find_by(id: params[:id])
    @company.update(company_params)
    redirect_to company_path
  end

  def destroy

  end

  private
  def company_params
    params.require(:company).permit(:name, :display_picture)
  end

end