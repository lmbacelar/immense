class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def index
    @query = params[:query]
    @departments = Department.search @query
    @paged_departments = @departments.page params[:page]
    authorize @paged_departments
    respond_to do |format|
      format.html
      format.json
      format.csv  { send_data @departments.to_csv, filename: export_filename }
    end
  end

  def show
  end

  def new
    @department = Department.new company: current_user.company
    authorize @department
    render 'shared/new_or_edit'
  end

  def edit
    render 'shared/new_or_edit'
  end

  def create
    @department = Department.new department_params
    authorize @department
    respond_to do |format|
      if @department.save
        format.html { redirect_to @department, notice: 'Department was successfully created.' }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render 'shared/new_or_edit' }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to @department, notice: 'Department was successfully updated.' }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render 'shared/new_or_edit' }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @department.destroy
    respond_to do |format|
      format.html { redirect_to departments_url, notice: 'Department was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    authorize Department
    Department.from_csv params[:file]
    redirect_to departments_url, notice: 'Departments imported.'
  end

  def autocomplete
    company = Company.find_by short_name: params[:company]
    departments = company.departments.where("name ilike '%#{params[:term]}%'").order(:name)
    authorize departments
    render json: departments.pluck(:name)
  end

  private
    def set_department
      @department = Department.friendly.find params[:id]
      authorize @department
    end

    def department_params
      params.require(:department).permit(:name, :full_name, :designation, :company)
    end
end
