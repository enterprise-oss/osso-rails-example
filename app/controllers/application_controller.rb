class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: 'saml_sign_in'
end
