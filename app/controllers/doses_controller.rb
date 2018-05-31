class DosesController < ApplicationController
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def index
    @doses = Dose.all
  end

  def destroy
    dose = Dose.find(params[:id])
    dose.destroy
    redirect_to cocktails_path
  end

  private

  def dose_params
  params.require(:dose).permit(:description, :ingredient_id)
  end
end
