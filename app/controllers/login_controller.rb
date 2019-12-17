class LoginController < ApplicationController
  skip_before_action :verify_authenticity_token

    def create
      user = Author.find_by("lower(username) = ?", params[:username].downcase)
      if user && user.authenticate(params[:password])
        render json: { token: token(user.id), user_id: user.id }
      else
        render json: { errors: [ "That doesn't match any user info we have on file" ] }, status: :unprocessable_entity
      end 
    end

  end 