class RelationshipsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @relationship = Relationship.first
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end

end