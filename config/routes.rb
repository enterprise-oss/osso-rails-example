Rails.application.routes.draw do
  root 'application#saml_sign_in'
  get 'users/saml_sign_in', to: 'application#saml_sign_in'
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }, :skip => [:registrations], :path_names => { :sign_in => "saml_sign_in" }
end
