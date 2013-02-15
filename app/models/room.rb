class Room < ActiveRecord::Base
  attr_accessible :bed_count, :number

  validates_presence_of :bed_count, :number
  validates_uniqueness_of :number
  
  has_many :bookings
  
  def available?(start_date, stop_date)
    outcome = true
    user_start_date_array = start_date.split("/")
    user_start_date = Date.new(user_start_date_array[2].to_i,user_start_date_array[0].to_i,user_start_date_array[1].to_i).to_time
    user_stop_date_array = stop_date.split("/")
    user_stop_date = Date.new(user_stop_date_array[2].to_i,user_stop_date_array[0].to_i,user_stop_date_array[1].to_i).to_time
    self.bookings.each do |booking|
      #behold one UGLY chunk of code!
      dates_in_order = [user_start_date, user_stop_date, booking.start_date, booking.stop_date].sort
      dates_hash = Hash[dates_in_order.map.with_index.to_a]
      unless dates_hash[user_stop_date] - dates_hash[user_start_date] == 1 && dates_hash[booking.stop_date] - dates_hash[booking.start_date] == 1
        outcome = false
        next
      end
    end
    outcome
  end
end
