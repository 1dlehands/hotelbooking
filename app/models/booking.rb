class Booking < ActiveRecord::Base
  attr_accessible :room_id, :start_date, :user_id, :stop_date
  
  validates_presence_of :room_id, :user_id, :stop_date, :start_date
  validate :start_date_cannot_be_in_the_past, :if => "!start_date.nil?"
  validate :stop_date_cannot_be_start_date, :if => "!start_date.nil? && !stop_date.nil?"
    
  belongs_to :room 
  belongs_to :user
  
  def start_date_cannot_be_in_the_past
    if start_date < Date.today && 
      errors.add(:start_date, "can't be in the past!")
    end
  end
  
  def stop_date_cannot_be_start_date
    if stop_date.to_date <= start_date.to_date
      errors.add(:stop_date, "booking must span at least one day!")
    end
  end
  
end
