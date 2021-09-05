Rails.application.routes.draw do
  get 'posts/index' => "posts#index"
  get 'posts/index/:id' => "posts#index_category"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get 'posts/:id' => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  get "posts/:id/suggestion" => "posts#suggestion"
  post "posts/:id/suggestion/create" => "posts#suggestion_create"
  get "posts/:id/select" => "posts#select"
  post "posts/:id/select/decision" => "posts#select_decision"
  get "signup" => "users#new"
  post "users/create" => "users#create"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "users/:id" => "users#user_page"
  post "chat/:id" => "posts#chat"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "home#top"
end
