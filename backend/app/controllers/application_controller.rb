class ApplicationController < ActionController::API

  include Response
  include Sessions
  before_action :authenticate_user

end
