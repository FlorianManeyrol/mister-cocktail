class DosesController < ApplicationController

  before_action :find_cocktail, only: [:create]

  def create
    @dose = @cocktail.doses.build(dose_params)
    if @dose.save
      redirect_to @cocktail
    else
      render 'cocktail/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to @dose.cocktail
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end

