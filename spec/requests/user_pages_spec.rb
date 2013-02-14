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
  
  # describe "profile page" do
  #   let(:user) { FactoryGirl.create(:user) }
  #   before { visit users_path(user) }
  #   
  #   it { should have_selector('h1', text: user.email) }
  # end
end
