module Api
  module V1
    module Public
      class BaseController < ApplicationController
        before_action -> { Post.set_default_param(:slug) }
      end
    end
  end
end
