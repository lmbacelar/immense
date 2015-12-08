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
      format.csv  { set_filename_and_render }
    end
  end

  def show
  end

  def new
    @department = Department.new
    authorize @department
  end

  def edit
  end

  def create
    @department = Department.new department_params
    authorize @department
    respond_to do |format|
      if @department.save
        format.html { redirect_to @department, notice: 'Department was successfully created.' }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new }
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
        format.html { render :edit }
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
    Department.import params[:file]
    redirect_to departments_url, notice: 'Departments imported.'
  end

  private
    def set_department
      @department = Department.friendly.find params[:id]
      authorize @department
    end

    def department_params
      params.require(:department).permit(:name, :full_name, :designation)
    end

    def set_filename_and_render
      response.headers["Content-Disposition"] = "attachment; filename=\"#{export_filename}\""
    end

    def export_filename
      "departments_#{Time.zone.now.strftime('%Y%m%d_%H%M%S')}.#{params[:format]}"
    end
end