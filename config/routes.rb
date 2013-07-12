RailsJqueryFileupload::Application.routes.draw do
  resources :products do
    resources :pictures
  end
  resources :pictures
  root to: "products#index"
end
