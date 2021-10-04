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
    private
      def user_params
        params.require(:user).permit(:name, :nickname, :birthdate,:password, :password_confirmation, :cellphone, :email)
      end
end
  