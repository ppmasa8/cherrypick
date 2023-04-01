Rails.application.routes.draw do
  get "home/index" => "home#index"
  post "home/new" => "home#new"
  get "home/new" => "home#new"
  root "home#index"
end
