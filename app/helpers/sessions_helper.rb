module SessionsHelper
  
  def sign_in(user)
    session[:user_id] = user.id
    self.current_user = user
  end
  
  def sign_out
    self.current_user = nil
    session[:user_id] = nil
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      nil
    end
  end
  
  def signed_in?
    current_user != nil
  end
end
