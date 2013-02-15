module ApplicationHelper
  def datetimed(time)
    date_array = time.split("/")
    date_time = Date.new(date_array[2].to_i,date_array[0].to_i,date_array[1].to_i).to_datetime
    date_time
  end
end
