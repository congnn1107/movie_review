module Api
  module V1
    module Admin
      class BaseController < ApplicationController
        before_action :authenticate_user
        before_action :admin_user
        before_action -> { Post.set_default_param }
      end
    end
  end
end
