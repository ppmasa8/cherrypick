Rails.application.routes.draw do
  root "home#index"
  get "home/index" => "home#index"
  post "home/post" => "home#post"
  get "home/post" => "home#post"
end
