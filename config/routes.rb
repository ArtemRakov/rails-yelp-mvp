Rails.application.routes.draw do
    # This route sends requests to our naked url to the *cool* action in the *gif* controller.
    root 'restaurants#index'
    get '/login', to: 'sessions#new', as: :login
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'

    # These routes will be for signup. The first renders a form in the browse, the second will
    # receive the form and create a user in our database using the data given to us by the user.
    get '/signup' => 'users#new'
    post '/users' => 'users#create'

  resources :restaurants, only: [:index, :create, :new, :show] do
    resources :reviews, only: [:create, :new]
  end

  namespace :admin do
    resources :restaurants do
      resources :reviews, only: [:create, :new]
    end
  end
end
