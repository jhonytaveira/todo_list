Rails.application.routes.draw do
  root 'boards#index'

  resources :boards, only: %i[index new create]
  resources :steps, only: %i[new edit create update]
  resources :tasks, except: [:index]
end
