class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create]
  skip_before_filter :verify_authenticity_token, only: [:destroy]

  def create
    auth = request.env['omniauth.auth']
    user = nil
    begin
      user = User.find_by(flickr_id: auth['uid']) #raise_not_found_error configuration option. 
      user.update_with_omniauth(auth)
    rescue Mongoid::Errors::DocumentNotFound
      user = User.create_with_omniauth(auth)
      #FetchPhotosWorker.perform_async(user.id)
    end
    session[:user_id] = user.id
    redirect_to root_url, success: t(:'.logged_in')
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, success: t(:'.logged_out')
  end
end
