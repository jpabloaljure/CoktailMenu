class ApplicationController < ActionController::Base
  protect_from_forgery
  def validateAuth
    
    if (session[:userdata]==nil)
      redirect_to new_session_path
      return false;
    else      
      return true;
    end
    
  end
  
end
