class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      flash[:notice] = "Sign in successful!"
      redirect_to rooms_path
    else
      flash.now[:error] = 'Invalid email or password'
      render 'new'
    end
  end
  
  def destroy
    sign_out
    flash[:notice] = "Successfully signed out!"
    redirect_to signin_path
  end
end
