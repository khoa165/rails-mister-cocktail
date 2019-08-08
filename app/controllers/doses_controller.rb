class DosesController < ApplicationController
  before_action :find_cocktail
  before_action :find_dose, only: [:destroy]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_strong_params)
    @dose.cocktail =  @cocktail
    if @dose.save #return true or false
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def find_dose
    @dose = Dose.find(params[:id])
  end
end
