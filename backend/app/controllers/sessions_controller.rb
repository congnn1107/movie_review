class SessionsController < Devise::SessionsController

    skip_before_action :authenticate_user, only: [:create]

    def create
        user = User.find_by(email: params[:email])
        if user && user.valid_password?(params[:password])
            json_response({ user: user, token: user.generate_token })
        else
            json_response({error: "Invalid login infomation!"}, :unauthorized)
        end
    end
    
end
