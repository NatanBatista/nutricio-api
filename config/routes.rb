Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  
  resources :foods do
    delete "bulk_destroy", on: :collection
  end
end
