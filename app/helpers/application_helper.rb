module ApplicationHelper
  def datetimed(time)
    date_array = time.split("/")
    date_time = Date.new(date_array[2].to_i,date_array[0].to_i,date_array[1].to_i).to_datetime
    date_time
  end

  def displaydated(date)
    day = date.day.to_s
    day = "0" + day if day.length < 2
    month = date.month.to_s
    month = "0" + month if month.length < 2
    day + "/" + month + "/" + date.year.to_s
  end
end
