Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :questions do
    member do
      post :answered
      post :unanswered
    end
  end

  root to: "questions#new"
end
