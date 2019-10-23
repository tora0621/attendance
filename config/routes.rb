Rails.application.routes.draw do

  root to: 'shifts#index'
  resources :shifts do
    collection do
      get :start
      get :finish
      get :rest_time_start
      get :rest_time_end
    end
    # member do
    #   get :finish
    #   get :rest_time_start
    #   get :rest_time_end
    # end
  end

  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'   
} 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  
end
