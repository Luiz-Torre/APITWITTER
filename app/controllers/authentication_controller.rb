class AuthenticationController < ApplicationController
    def login
      user = User.find_by(email: params[:user][:email])
      user = user&.authenticate(params[:user][:password])
      if user
        token = JsonWebToken.encode(user_id: user.id)
        render json: {token: token, user: user}
      
      else
        render json: {message: "CPF ou senha incorreta"}, status: 401
      end
    end
  end
  