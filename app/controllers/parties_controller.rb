require "rqrcode"
require "chunky_png"

class PartiesController < ApplicationController
  before_action :set_party, only: [:show, :edit, :update]

  def index
    @parties = Party.all
  end

  def show
    @recipes = Recipe.all
    @party_recipe = Recipe.where(user_id: @party.id)

    qrcode = RQRCode::QRCode.new("https://supperclub.pro/parties/#{@party.id}")

      png = qrcode.as_png(
        bit_depth: 1,
        border_modules: 1,
        color_mode: ChunkyPNG::COLOR_GRAYSCALE,
        color: "black",
        file: nil,
        fill: "white",
        module_px_size: 10,
        resize_exactly_to: false,
        resize_gte_to: false,
        size: 250
      )

      IO.binwrite("./app/assets/images/qr_code#{@party.title}.png", png.to_s)
  end

  def new
    @party = Party.new
  end

  def ingredients
    @party = Party.find(params[:party_id])
    @party_recipe = @party.recipes
    @party_recipe.each do |recipe|
    @ingredients = recipe.ingredients
    @recipe_ingredient = RecipeIngredient.new
  end
  end

  def create
    puts params[:party]
    # if @party.save
    #   redirect_to party_path(@party)
    # else
    #   render :new, status: :unprocessable_entity
    # end
    respond_to do |format|
      format.json { render :json => @recipes }
      format.html { puts "I am html" }
    end
  end

  def edit
  end

  def update
    if @party.update(party_params)
      redirect_to @party
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def party_params
<<<<<<< HEAD
    params.require(:party).permit(:title, :address, :date, :theme, :attendancy, :appetizers, :mains, :desserts, :qr_code)
=======
    params.require(:party).permit(:title, :address, :date, :theme, :attendancy, :appetizers, :mains, :desserts, :party, :parties, :data)
>>>>>>> d88e4e735bf28faaddecac39c5a588939ac7851a
  end

  def set_party
    @party = Party.find(params[:id])
  end
end
