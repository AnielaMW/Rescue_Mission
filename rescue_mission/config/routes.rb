Rails.application.routes.draw do
  resources :users

  resources :questions do
    resources :answers, only: [:index, :new, :create]
  end

  resources :answers, except: [:index, :new, :create]
end
