class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @parties = Party.all
    @my_party = Party.where(user_id: current_user)
    @color = ["#C9FBC5", "#F45F5F",  "#67D480", "#C9FBC5", "#67D480" , "#F45F5F",  "#FCA04C",  "#C9FBC5", "#F45F5F",  "#FCA04C", "#67D480" , "#C9FBC5",  "#FCA04C", "#F45F5F",  "#FCA04C", "#67D480"  ]
  end
end
