class RelationshipsController < ApplicationController
  before_filter :authenticate_user!

  def list
    # list the current relationships for the current user (assumed mentor)
    @relationships = Relationship.where(mentor: current_user)
  end

  def create_entry
    relationship_id = Relationship.find_by_mentee_id( current_user.id ).id
    entry_type = params[:entry_type]
    if entry_type == 'emoticon'
      text = params[:emoticon]
    else
      text = params[:text]
    end
    entry = Entry.new(
        author: current_user,
        relationship_id: relationship_id,
        text: text,
        entry_type: entry_type,
        question: params[:question]
        )
    entry.save!
    redirect_to action: 'index'
  end

  def show
    @relationship = Relationship.find(params[:id])
  end

end
