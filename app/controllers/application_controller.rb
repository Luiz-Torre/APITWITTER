class ApplicationController < ActionController::API
    rescue_from CanCan::AccessDenied do |exception|
        render json:{error: "Permissão negada"}, status: 403
    end

    def current_user
        header = request.headers["Authorization"]
        header = header.split(" ").last if header
        
        return nil unless header.present?
        @decoded = JsonWebToken.decode(header)
        return nil unless @decoded
        
        user = User.find_by(id: @decoded[0]['user_id'])
        return user
    end

    def validate_user
        if current_user.present?
            render json: {status: "Logado com Sucesso!", user: current_user}
        else
            render json: {status: "Você não está logado!"}, status: 401
        end
    end

end
