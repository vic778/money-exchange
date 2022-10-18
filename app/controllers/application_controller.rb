class ApplicationController < ActionController::Base
  respond_to :json, :html
  skip_before_action :verify_authenticity_token
end
