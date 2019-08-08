class DosesController < ApplicationController
  before_action :find_cocktail, only: [:new, :create]

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
    raise
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to root_path
  end

  private

  def dose_strong_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  # def find_dose
  #   @dose = Dose.find(params[:id])
  # end
end
