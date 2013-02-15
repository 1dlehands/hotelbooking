require 'spec_helper'

describe Room do
  before do
    @room = Room.new(number: 101, bed_count: 2)
  end
  
  subject { @room }
  
  it { should respond_to(:number) }
  it { should respond_to(:bed_count) }

  it { should be_valid }

  describe "when the room number is nil" do
    before { @room.number = nil }
    it { should_not be_valid }
  end

  describe "when the bed_count is nil" do
    before { @room.bed_count = nil }
    it { should_not be_valid }
  end


  it "isn't valid if the room number is already in use" do
    @room.save
    @room2 = Room.new(number: 101, bed_count: 2)
    @room2.should_not be_valid
  end
  
end
