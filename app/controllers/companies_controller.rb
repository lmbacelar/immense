class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @query = params[:query]
    @companies = Company.search @query
    @paged_companies = @companies.page params[:page]
    authorize @paged_companies
    respond_to do |format|
      format.html
      format.json
      format.csv  { send_data @companies.to_csv, filename: export_filename }
    end
  end

  def show
  end

  def new
    @company = Company.new
    authorize @company
    render 'shared/new_or_edit'
  end

  def edit
    render 'shared/new_or_edit'
  end

  def create
    @company = Company.new company_params
    authorize @company
    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render 'shared/new_or_edit' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render 'shared/new_or_edit' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    authorize Company
    Company.from_csv params[:file]
    redirect_to companies_url, notice: 'Companies imported.'
  end

  def autocomplete
    companies = Company.where("short_name ilike '#{params[:term]}%'").order(:short_name)
    authorize companies
    render json: companies.pluck(:short_name)
  end

  private
    def set_company
      @company = Company.friendly.find params[:id]
      authorize @company
    end

    def company_params
      params.require(:company).permit(:short_name, :name, :vat_number, :vat_prefix)
    end
end
