class Room < ActiveRecord::Base
  attr_accessible :bed_count, :number

  validates_presence_of :bed_count, :number
  validates_uniqueness_of :number
  
  has_many :bookings
  
  def available?(user_start_date, user_stop_date)
    outcome = true
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
