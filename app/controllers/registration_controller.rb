class RegistrationController < ApplicationController
    def sign_up
    #Criando Novo User
      @user = User.new(user_params)
      #Verificando se o user foi salvo
      if @user.save
        #Verificando se gerou o token
        if @user.generate_password_token
            
          UserMailer.with(user: @user).registration_confirmation.deliver_now
          render json: {user: @user}, status: :created
        
        #Destruir o novo Usuario se o token foi invalido
        else
            @user.destroy
            render json: {message: "não foi possivel gerar o email"}, status: :unprocessable_entity
          end
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    
    end
    #Confirmar o email
    def confirm_email
      token = params[:token].to_s

    if params[:token].blank?
      return render json: {error: 'Token Invalido'}, status: :not_found
    end

    user = User.find_by(validate_token: token)

    if user.present? && user.validate_token_valid?
        user.email_activate
        flash[:success] = "Email confirmado"
      else
        flash[:error] = "Token Invalido"
      end
    end
    
    private
      def user_params
        params.require(:user).permit(:name, :nickname, :birthdate,:password, :password_confirmation, :cellphone, :email)
      end
end
  