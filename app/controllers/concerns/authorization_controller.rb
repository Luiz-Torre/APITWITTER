class PasswordController < ApplicationController

    #Confirmar a conta
    def confirm
      token = params[:token].to_s
  
      if params[:token].blank?
          return render json: {error: 'Operação invalida'}, status: :not_found
      end
  
      user = User.find_by(validate_token: token)
      if user.present? && user.validate_token_valid?
          if user.confirm
            render json: {status: 'ok'}, status: :ok         
          else
              render json: {error: user.errors.full_messages}, status: :unprocessable_entity
          end
      else
          render json: {error:  ['Link não é valido ou expirou. Tente novamento com um novo link.']}, status: :not_found
      end
    end
  
    
  end
  