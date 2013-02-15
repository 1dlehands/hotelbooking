class RoomsController < ApplicationController

  def index
    if !session[:user_id]
      redirect_to '/signin'
    end
    @rooms = Room.all
    @start_date = params[:start_date] if params[:start_date]
    @end_date = params[:end_date] if params[:end_date]
  end
  
end
