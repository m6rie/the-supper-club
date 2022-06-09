class PartiesController < ApplicationController
  before_action :set_party, only: [:show, :edit, :update]

  def index
    @parties = Party.all
  end

  def show
    @recipes = Recipe.all
    @party_recipe = Recipe.where(user_id: @party.id)
  end

  def new
    # @party_date = PartyDate.new
    # @party_theme = PartyTheme.new
    # @theme = Theme.new
    # @party_theme = @theme
    @party = Party.new
  end

  def ingredients
    @party = Party.find(params[:party_id])
    @party_recipe = @party.recipes

    @party_recipe.each do |recipe|
      @ingredients = recipe[:ingredients].split(",")
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

  private

  def party_params
    params.require(:party).permit(:title, :address, :date, :theme, :attendancy, :appetizers, :mains, :desserts)
  end

  def set_party
    @party = Party.find(params[:id])
  end
end
