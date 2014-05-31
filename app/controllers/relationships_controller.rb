class RelationshipsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @relationship = Relationship.first
  end
  
  def create
    relationship_id = Relationship.find_by_mentee_id( current_user.id ).id
    entry = Entry.new(text: params[:text], author: current_user, relationship_id: relationship_id)
    entry.save!
    redirect_to action: 'index'
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end

end
