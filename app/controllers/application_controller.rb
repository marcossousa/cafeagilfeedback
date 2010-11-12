class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  respond_to :html
end
