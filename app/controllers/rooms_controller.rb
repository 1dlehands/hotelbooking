class RoomsController < ApplicationController

  def index
    if !session[:user_id]
      redirect_to '/signin'
    end
    #if params[:start_date] && params[:end_date]
  end
end
