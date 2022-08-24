module Api
  module V1
    module Users
      class UsersController < BaseController
        skip_before_action :authenticate_user, only: [:create]

        def create
          @user = User.new(user_params)
          if @user.save
            json_response(@user)
          else
            json_response({ error: @user.errors.full_messages }, :unprocessable_entity)
          end
        end

        def update
          if @current_user && @current_user.update(user_params)
            @current_user.avatar.attach(params[:avatar]) unless params[:avatar].nil?

            json_response(@current_user)
          else
            json_response({ error: "Something went wrong!" }, :unprocessable_entity)
          end
        end

        def show
          json_response(@current_user)
        end

        private

        def user_params
          params.permit(:name, :email, :password, :password_confirmation)
        end
      end
    end
  end
end
