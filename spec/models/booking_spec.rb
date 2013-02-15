require 'spec_helper'

describe Booking do
  before do
    @booking = Booking.new(user_id: 1, room_id: 1, start_date: 10.days.from_now, stop_date: 11.days.from_now)
  end

  subject { @booking }

  it { should respond_to(:user_id) }
  it { should respond_to(:room_id) }
  it { should respond_to(:start_date) }
  it { should respond_to(:stop_date) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @booking.user_id = nil }
    it { should_not be_valid}
  end

  describe "when room_id is not present" do
    before { @booking.room_id = nil }
    it { should_not be_valid}
  end

  describe "when start_date is not present" do
    before { @booking.start_date = nil }
    it { should_not be_valid}
  end

  describe "when stop_date is not present" do
    before { @booking.stop_date = nil }
    it { should_not be_valid}
  end
end
