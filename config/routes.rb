Rails.application.routes.draw do
  root :to => redirect('/users/sign_in')
  devise_for :users, :controllers => {:registrations => "registrations"}

  get 'relationships', to: 'relationships#list'
  get 'relationships/:id', to: 'relationships#show'
  #get 'relationships/:id/new', to: 'relationships#new'
  get ':controller(/:action(/:id))'
  # resources :users, :relationships

  resources :relationships do
    resources :entries, shallow: true
  end

end
