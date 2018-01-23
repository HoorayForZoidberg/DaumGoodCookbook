class MeasuresController < ApplicationController
  before_action :find_measure, except: [ :index, :new, :create ]

  def index
    @measures = Measure.order('LOWER(name)')
  end

  def show
  end

  def new
    @measure = Measure.new
  end

  def create
    @measure = Measure.new(measure_params)
    if @measure.save
      redirect_to measure_path(@measure)
    else
      render 'measures/show'
    end
  end

  def edit
  end

  def update
    @measure.update(measure_params)
    redirect_to measure_path(@measure)
  end

  def destroy
    @measure.destroy
    redirect_to measures_path
  end

  private

  def measure_params
    params.require(:measure).permit(:name)
  end

  def find_measure
    @measure = Measure.find(params[:id])
  end
end
