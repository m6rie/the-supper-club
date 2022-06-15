require "rqrcode"
require "chunky_png"

class PartiesController < ApplicationController
  before_action :set_party, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :invite

  def home
    @parties = Party.all
  end

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
    respond_to do |format|
      format.html
      format.pdf do
        render  pdf: "Ingredients",
                template: "parties/ingredients",
                formats: [:html],
                disposition: :inline,
                layout: 'pdf'
      end
    end
  end

  def create
    # ALL RECIPES
    @recipes = []
    # SAVING ATTRIBUTES
    number_of_recipes = params[:party][:recipes_data][:title].size
    titles = params[:party][:recipes_data][:title]
    photo_urls = params[:party][:recipes_data][:photo]
    urls = params[:party][:recipes_data][:url]
    # ingredients = params[:party][:recipes_data][:ingredients] ------ ingredients: ingredients[n - 1] ------ TBA -------
    # BUILDING RECIPES
    number_of_recipes.times do |n|
      @recipes << Recipe.create(title: titles[n - 1], recipe_url: urls[n - 1], photo_url: photo_urls[n - 1], prep_time: 30, description: "Delicous recipe")
    end

    # CREATING PARTY
    @party = Party.create(
      user: current_user,
      title: params[:party][:title],
      address: params[:party][:address],
      theme: params[:party][:theme],
      date: params[:party][:date],
      attendancy: params[:party][:attendancy],
      appetizers: params[:party][:appetizers],
      mains: params[:party][:mains],
      desserts: params[:party][:desserts]
    )

    # CONNECTING PARTIES AND RECIPES
    @recipes.each do |recipe|
      PartyRecipe.create(party: @party, recipe: recipe)
    end

    # AJAX RESPONSE
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
    @party.destroy
    redirect_to root_path, status: :see_other
  end

  def invite
    @party = Party.find(params[:party_id])
  end

  private

  def party_params
    params.require(:party).permit(:title, :address, :date, :theme, :attendancy, :appetizers, :mains, :desserts, :recipes_data )
  end

  def set_party
    @party = Party.find(params[:id])
  end
end
