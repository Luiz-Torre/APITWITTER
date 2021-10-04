class User < ApplicationRecord

    has_secure_password
    validates :name, :email, presence: true
    validates :password, :password_confirmation, length: {minimum:8}, :if => :password
    VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    validates :email, uniqueness: true, length:{maximum:100}
    validates :cellphone, presence: true, uniqueness: true, format: {with: /(\(?\d{2}\)?\s)?(\d{4,5}\-\d{4})/, message: "Utilize um telefone valido. Exemplo: (21) 90000-0000"}
    before_save {self.email = email.downcase}


    def generate_password_token
        self.validate_token = generate_token
        self.validate_token_sent_at = Time.now.utc
        self.save
    end
    def validate_token_valid?
        (self.validate_token_sent_at + 7.days) > Time.now.utc
    end

    private 
        
        
        
    def generate_token
        SecureRandom.alphanumeric(10)
    end
end
