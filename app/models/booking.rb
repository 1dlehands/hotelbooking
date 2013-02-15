class Booking < ActiveRecord::Base
  attr_accessible :room_id, :start_date, :user_id, :stop_date
  
  validates_presence_of :room_id, :start_date, :user_id, :stop_date
  
  belongs_to :room 
  belongs_to :user
  
end
