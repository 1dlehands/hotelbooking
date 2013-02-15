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
    let(:user) { FactoryGirl.create(:user) }
    before do
      10.times { FactoryGirl.create(:room) }
      visit root_url
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Sign in"
      fill_in "start_date", with: '05/13/2013'
      fill_in "stop_date", with: '05/15/2013'
      click_on 'Search for rooms'
    end

    it { should have_content('Room availability') }
    it { should have_content('Room number') }
  end

end
