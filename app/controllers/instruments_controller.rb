class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]

  def index
    @query = params[:query]
    @instruments = Instrument.search @query
    @paged_instruments = @instruments.page params[:page]
    authorize @paged_instruments
    respond_to do |format|
      format.html
      format.json
      format.csv  { send_data @instruments.to_csv, filename: export_filename }
    end
  end

  def show
  end

  def new
    @instrument = current_user.instruments.new
    authorize @instrument
    render 'shared/new_or_edit'
  end

  def edit
    render 'shared/new_or_edit'
  end

  def create
    @instrument = current_user.instruments.new instrument_params
    authorize @instrument
    respond_to do |format|
      if @instrument.save
        format.html { redirect_to @instrument, notice: 'Instrument was successfully created.' }
        format.json { render :show, status: :created, location: @instrument }
      else
        format.html { render :new }
        format.json { render json: @instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @instrument.update(instrument_params)
        format.html { redirect_to @instrument, notice: 'Instrument was successfully updated.' }
        format.json { render :show, status: :ok, location: @instrument }
      else
        format.html { render :edit }
        format.json { render json: @instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @instrument.destroy
    respond_to do |format|
      format.html { redirect_to instruments_url, notice: 'Instrument was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    authorize Instrument
    Instrument.from_csv params[:file]
    redirect_to instruments_url, notice: 'Instruments imported.'
  end

  private
    def set_instrument
      @instrument = Instrument.friendly.find params[:id]
      authorize @instrument
    end

    def instrument_params
      params.require(:instrument).permit(:reference, :designation, :manufacturer, :model, :part_number, :serial_number, :remarks)
    end
end
