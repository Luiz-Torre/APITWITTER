class JsonWebToken
    Secret = "jkasbdhjkasbdjkasnskadnsadlklksdns123.651603206505862sdsadsasas54165ds165f1ds561f56sd1f65sd1f65sd165f1s65f1651fsd651f65sd1fsd65f165sd1f65sd1s"
    def self.encode(payload)
        JWT.encode(payload, Secret)
    end
    def self.decode(token)
        begin
            JWT.decode(token, Secret)
            
        rescue => exception
            return nil    
        end

    end
end
