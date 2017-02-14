Rails.application.routes.draw do
  devise_for :users
  resources :users

  root :to => "questions#index"

  resources :questions do
    resources :answers, only: [:index, :new, :create]
  end

  resources :answers, except: [:index, :new, :create]
end
