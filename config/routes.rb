RailsJqueryFileupload::Application.routes.draw do
  resources :products
  resources :pictures
  root to: "products#index"
end
