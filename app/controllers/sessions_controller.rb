class SessionsController < ApplicationController
  def new
     
   end
   
   def create
     @ultimo=User.where("name = ? and pass = ?",params[:user],params[:password]).first()
     if(!@ultimo.nil?)
       session[:userdata]=@ultimo.name
       redirect_to cocktails_path
     else
       redirect_to new_session_path, :notice => 'Autenticacion fallida'
     end
  end 


  def destroy
    reset_session
    redirect_to cocktails_path, :notice => 'Sesion terminada'
  end 
end
