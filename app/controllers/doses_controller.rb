class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.create(cocktail_strong_params)
    if @cocktail.save #return true or false
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end
end
