Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations], controllers: { sessions: 'sessions' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  get :statistic_summary, to: "home#statistic_summary"
  get :general_setting, to: "general_setting#edit"
  patch :general_setting, to: "general_setting#update"
  resources :meters do
    member do
      get :month_information
    end
  end
  resources :bills
  resources :gold_investments
end
