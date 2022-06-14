class ConversationsController < ApplicationController

  def index
    @convo = Conversation.all
  end
end
