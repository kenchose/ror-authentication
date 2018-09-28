class SessionsController < ApplicationController
  # def new
  #     # render login page
  # end
  # def create
  #     # Log User In
  #     # if authenticate true
  #         # save user id to session
  #         # redirect to users profile page
  #     # if authenticate false
  #         # add an error message -> flash[:errors] = ["Invalid"]
  #         # redirect to login page
  # end
  # def destroy
  #     # Log User out
  #     # set session[:user_id] to null
  #     # redirect to login page
  # end
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "@user"
    else
      flash[:errors] = ["Invalid Combination"]
      redirect_to new_session_path
    end
  end

  def destroy
    reset session
    redirect_to new_sessions_path
  end

end