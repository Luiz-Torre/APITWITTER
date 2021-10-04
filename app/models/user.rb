class User < ApplicationRecord
    has_secure_password


    #Validações
    validates :name,:nickname, :birthdate, :email, presence: true
    validates :password, :password_confirmation, length: {minimum:8}, :if => :password
    VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    validates :email, uniqueness: true, length:{maximum:100}
    validates :cellphone, presence: true, uniqueness: true, format: {with: /(\(?\d{2}\)?\s)?(\d{4,5}\-\d{4})/, message: "Utilize um telefone valido. Exemplo: (21) 90000-0000"}



    #auxiliar na validação do email 
    before_save {self.email = email.downcase}


    #Gerar o Token para a validação da conta
    def generate_password_token
        self.validate_token = generate_token
        self.validate_token_sent_at = Time.now.utc
        self.save
    end

    #Gerar o prazo para confirmação da conta 
    def validate_token_valid?
        (self.validate_token_sent_at + 7.days) > Time.now.utc
    end

    def email_activate
        self.email_confirmed = true
        self.validate_token= nil
        save!(:validate => true)
    end

    #Gerar o token
    private       
        def generate_token
            SecureRandom.alphanumeric(15)
        end
end
