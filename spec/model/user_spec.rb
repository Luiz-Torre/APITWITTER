require 'spec_helper'


RSpec.describe User, :type => :model do
    context "Validar validações " do
        it "Ele é valido" do
           user = User.new(name: "Luiz", email: "luizmptorre@gmail.com", password: "senha1234",	password_confirmation: "senha1234", birthdate: "01/01/2001", cellphone: "(21)9006-1234", nickname: "luiz"
           )
           expect(user).to be_valid
        end
        it "Não é valido" do
            user = User.new(name: "Luiz", password: "senha1234",	password_confirmation: "senha1234", birthdate: "01/01/2001", cellphone: "(21)9006-1234", nickname: "luiz"
           )
           expect(user).to_not be_valid
        end
    end
    

end