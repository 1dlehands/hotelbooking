require 'spec_helper'

describe User do
  before do
    @user = User.new(email: "test@email.com", password: "password", password_confirmation: "password" )
  end

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password_confirmation)}

  it { should be_valid }

  describe "when email is not present" do
    before { @user.email = nil }
    it {should_not be_valid }
  end
  
  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = "" }
    it { should_not be_valid }
  end
  
  describe "when password confirmation doesn't match password" do
    before {@user.password_confirmation = "something else" }
    it { should_not be_valid }
  end
  
  describe "when password confirmation is nil" do
    before {@user.password_confirmation = nil }
    it { should_not be_valid }
  end
  
  describe "user authentication" do
    it { should respond_to(:authenticate) }
    before { @user.save }
    
    context "with valid password" do
      let(:existing_user) { User.find_by_email(@user.email) }
      it { should == existing_user.authenticate(@user.password) }
    end
    
    context "without valid password" do
      let(:user_with_bad_password) { User.find_by_email(@user.email).authenticate("invalid password") }
      it { should_not == user_with_bad_password }
      specify { user_with_bad_password.should be_false }
    end
    
  end

end
