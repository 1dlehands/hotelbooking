class Booking < ActiveRecord::Base
  attr_accessible :end_date, :room_id, :start_date, :user_id
end
