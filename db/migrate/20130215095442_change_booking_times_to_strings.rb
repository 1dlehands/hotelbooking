class ChangeBookingTimesToStrings < ActiveRecord::Migration
  def up
    change_column("bookings", "start_date", "string")
    change_column("bookings", "end_date", "string")
  end

  def down
  end
end
