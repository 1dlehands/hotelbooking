class BookingsController < ApplicationController
  def create
    booking = Booking.new(params[:booking])
    booking.user_id = session[:user_id]
    booking.stop_date = (params[:booking][:stop_date])
    puts booking.inspect
    if booking.save
      flash[:notice] = 'Booking made!'
      redirect_to user_path(session[:user_id])
    else
      flash[:error] = booking.errors.full_messages
      redirect_to rooms_path
    end
  end
  
  def destroy
    booking = Booking.find(params[:id])
    booking.destroy
    flash[:notice] = 'Booking cancelled!'
    redirect_to user_path(session[:user_id])
  end
end
