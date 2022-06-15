class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @parties = Party.all
    @my_party = Party.where(user_id: current_user)
    @color = ["#C9FBC5", "#F45F5F",  "#FCA04C", "#67D480" ]
  end
end
