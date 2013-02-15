class Room < ActiveRecord::Base
  attr_accessible :bed_count, :number

  validates_presence_of :bed_count, :number
  validates_uniqueness_of :number
end
