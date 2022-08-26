module Api
  module V1
    module Users
      class VotesController < BaseController
        include Api::V1::Concerns::VotePost
        before_action :set_post
        before_action :prevent_self_vote
      end
    end
  end
end
