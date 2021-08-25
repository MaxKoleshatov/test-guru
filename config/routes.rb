Rails.application.routes.draw do
<<<<<<< HEAD
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: 'questions#index'
  
  resources :tests do
    resources :questions
  end

=======
  resources :tests do
    resources :questions, shallow: true
  end
>>>>>>> lesson_7_Controllers
end
# For details on the DSL available within this file, see https://guides.r