class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @parties = Party.all
    @my_party = Party.where(user_id: current_user.id)
  end
end
