Dapi::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get "avatars/show_latest/:profile_uuid", to: "avatars#show_latest"
  resources :avatars, only: [:show, :create]

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

end
