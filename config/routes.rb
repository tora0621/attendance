Rails.application.routes.draw do

  root to: 'wages#menu'
  resources :shifts do
    collection do
      get :start
      get :finish
      get :rest_time_start
      get :rest_time_end
    end
  end

  resources :workers do
    member do
      get :show_time
    end
    get 'search', to: 'workers#search'
  end

  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'   
} 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end

  resources :wages do
    collection do
      get :menu
      get :makanai
      get :eat
    end
  end
  
end
