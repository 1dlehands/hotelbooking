module RoomsHelper
  
  def valid_date?(date)
    date =~ /\d{2}\/\d{2}\/\d{4}/
  end
  
  def availability(room)
    room.available?(datetimed(@start_date), datetimed(@stop_date)) ? "open" : "booked"
  end

  def date_errors(start_date, stop_date)
    errors = []
    if start_date && stop_date && !valid_date?(start_date) or !valid_date?(stop_date)
      errors << "Please enter dates in the format MM/DD/YYYY"
    end
    if start_date && datetimed(start_date) < Time.now.to_date
      errors << "Start date can't be in the past!"
    end
    #elsif datetimed(start_date) >= datetimed(stop_date)
    #  return ""
    errors
  end

end
