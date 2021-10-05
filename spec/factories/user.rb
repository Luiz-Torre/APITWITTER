FactoryBot.define do

    factory :user do 
      name {"luiz"}
      email {"luiz@gmail.com.br"}
      password {"abcd1234"}
      password_confirmation {"abcd1234"}
      cellphone {"(21)9006-1234"}
      nickname {"luiz"}
      birthdate {"29/01/2001"}
    end
  
  end