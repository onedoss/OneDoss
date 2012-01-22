class HomeController < ApplicationController

  def index

    @user = User.new
    respond_to do |format|
       format.html
       format.json { render json: @user }
    end
  end


end
