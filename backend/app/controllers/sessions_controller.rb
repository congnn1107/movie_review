class SessionsController < Devise::SessionsController
  def create
    user = User.find_by(email: params[:email])
    if user && user.valid_password?(params[:password])
      json_response({ user: user, token: user.generate_token })
    else
      json_response({ error: "Invalid login infomation!" }, nil, :unauthorized)
    end
  end
end
