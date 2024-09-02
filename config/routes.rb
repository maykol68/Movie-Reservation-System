Rails.application.routes.draw do
  resources :genres, except: %i[show]
  resources :movies, path: '/' do 
    resources :showtimes, only:[:index,:show]
  end

  resources :reservations, only:[:new, :create]

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
end
