require "rqrcode"
require "chunky_png"

class PartiesController < ApplicationController
  before_action :set_party, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: :invite

  def index
    @parties = Party.all
  end

  def show
    @recipes = Recipe.all
    @party_recipe = Recipe.where(user_id: @party.id)

    qrcode = RQRCode::QRCode.new("https://supperclub.pro/parties/#{@party.id}/invite")

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
    @party = Party.new(party_params)
    @party.user_id = current_user.id
    # @party_date = PartyDate.new
    if @party.save
      redirect_to party_path(@party)
    else
      render :new, status: :unprocessable_entity
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

  def invite
    @party = Party.find(params[:party_id])
  end

  private

  def party_params
    params.require(:party).permit(:title, :address, :date, :theme, :attendancy, :appetizers, :mains, :desserts, :qr_code)
  end

  def set_party
    @party = Party.find(params[:id])
  end
end
