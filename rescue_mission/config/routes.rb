Rails.application.routes.draw do
  resources :users
  resources :questions
  resources :answers
end
