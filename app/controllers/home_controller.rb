class HomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to "/relationships/#{current_user.mentee_relationship.id}" if current_user.role.eql? 'mentee'
      redirect_to '/relationships' if current_user.role.eql? 'mentor'
    end
  end

end
