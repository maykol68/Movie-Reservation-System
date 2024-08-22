Rails.application.routes.draw do
  resources :genres, except: %i[show]
  resources :movies, path: '/'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
end
