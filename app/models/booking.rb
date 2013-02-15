class Booking < ActiveRecord::Base
  attr_accessible :end_date, :room_id, :start_date, :user_id

  validates_presence_of :end_date, :room_id, :start_date, :user_id
  
  belongs_to :room 
  belongs_to :user
end
