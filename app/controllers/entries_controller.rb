class EntriesController < ApplicationController
  before_filter :authenticate_user!

  def create
    Relationship.find(params[:relationship_id]).entries << Entry.new(text: params[:text], author: current_user)
    redirect_to "/relationships/#{params[:relationship_id]}"
  end

end
