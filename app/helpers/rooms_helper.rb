module RoomsHelper
  
  def valid_date?(date)
    date =~ /\d{2}\/\d{2}\/\d{4}/
  end
  
  def availability(room)
    room.available?(datetimed(@start_date), datetimed(@stop_date)) ? "open" : "booked"
  end
  
end
