class PartyDatesController < ApplicationController
  def index
    @partydates = PartyDate.all
  end

  def create
    @partydate = PartyDate.new(partydate_params)
    if @partydate.save
      "choose where to redirect"
    else
      "render the page where the form is"
    end
  end

  private

  def partydate_params
    params.require(:partydate).permit(:date, :votes)
  end
end
