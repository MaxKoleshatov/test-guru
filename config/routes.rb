Rails.application.routes.draw do

  resources :gists
  get 'welcome/index'
  get 'sessions/new'
  get 'users/new'

  devise_for :users, controllers: {sessions: 'sessions' }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :tests_users, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end
    resources :gists
    resources :badges
  end

  resources :feedback

  resources :badges

  resources :users_badges

  root 'welcome#index'
end
# For details on the DSL available within this file, see https://guides.r