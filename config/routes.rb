Rails.application.routes.draw do

  get 'welcome/index'
  get 'sessions/new'
  get 'users/new'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  resources :users, only: :create
  resource :session, only:  %i[create destroy]

  resources :tests do
    resources :questions, except: :index, shallow: true do
      resources :answers, except: :index, shallow: true
  end

  member do
    post :start
  end
end
  resources :tests_users, only: %i[show update] do
    member do
      get :result
    end
  end

  root 'welcome#index'
end
# For details on the DSL available within this file, see https://guides.r