require 'spec_helper'

describe "User pages" do
  subject { page }
  
  describe "signup" do
    before { visit '/signup' }
    
    it { should have_selector('h1', text: 'Sign up for an account') }
    
    describe "with valid information" do
      before do
        fill_in "Email", with: "test@email.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
      end
      
      it "should add a user with valid info" do
        expect do
          click_button "create my account"
        end.to change(User, :count).by(1)
      end
    end
    
    describe "with invalid info" do
      it "shouldn't add a user with invalid info" do
        expect { click_on "create my account" }.not_to change(User, :count)
      end
    end
  end

  describe "search availabilities" do
    
    context "when search dates are valid" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        10.times { FactoryGirl.create(:room) }
        visit '/signin'
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
        fill_in "start_date", with: "01/01/2045"
        fill_in "stop_date", with: "01/05/2045"
        click_on 'Search for rooms'
      end

      it { should have_content('Room availability') }
      it { should have_content('Room number') }
    end
    
    context "when search dates are in the past" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        10.times { FactoryGirl.create(:room) }
        visit '/signin'
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
        fill_in "start_date", with: "02/13/2013"
        fill_in "stop_date", with: "02/14/2013"
        click_on 'Search for rooms'
      end
      
      it { should have_content("Start date can't be in the past!") }
    end

    #context "when start date and stop date are the same day"
    
  end

end
