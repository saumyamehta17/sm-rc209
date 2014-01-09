SmRc209::Application.routes.draw do
  devise_for :users, path_names: { sign_in: "login" }
  resources :articles
  root 'articles#index'
end
