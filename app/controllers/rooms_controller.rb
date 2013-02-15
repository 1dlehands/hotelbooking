class RoomsController < ApplicationController

  def index
    if !session[:user_id]
      redirect_to '/signup'
    end
    @rooms = Room.all
    @start_date = params[:start_date] if params[:start_date]
    @stop_date = params[:stop_date] if params[:stop_date]
  end
  
end
