class CompaniesController < ApplicationController

  before_action :authenticate_company!


  def show
    @company = Company.find_by(id: params[:id])

    if (@company === nil)
      redirect_to root_path
    else

      @post = @company.post

      unless (@company.id === current_company.id)
        redirect_to root_path
      end

    end

  end

  def edit
    @company = Company.find_by(id: params[:id])

    if (@company === nil)
      redirect_to root_path
    else


      unless (@company.id === current_company.id)
        redirect_to root_path
      end

    end

  end

  def update
    @company = Company.find_by(id: params[:id])



   if (company_params[:display_picture].is_a?(String))

      @company.update(company_params)
      redirect_to company_path

    else

      uploaded_file = company_params[:display_picture].path
      cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)

      @company.update(company_params)
      @company.display_picture = cloudnary_file["url"]
      @company.save

      redirect_to company_path

    end

  end

  def destroy

  end

  private
  def company_params
    params.require(:company).permit(:name, :display_picture)
  end

end