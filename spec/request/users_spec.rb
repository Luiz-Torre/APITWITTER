require 'rails_helper'


RSpec.describe "UsersController", type: :request do
    def login
        user = create(:user)
        post '/login', params: {user: {email: user.email, password: 'abcd1234'}}
        response_body = JSON.parse(response.body)
        token = response_body['token']
    
        headers = { 'AUTHORIZATION' => token} 
    end
    
    describe "GET/users" do
        it "informações erradas do usuario" do
            get "/users/1", headers: login
            expect(response).to have_http_status(200)
        end 
    end
end