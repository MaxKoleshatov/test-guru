Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true
  end
end
# For details on the DSL available within this file, see https://guides.r