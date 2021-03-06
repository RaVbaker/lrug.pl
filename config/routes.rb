LrugPl::Application.routes.draw do
  resource :welcome, :only => :show
  resources :events, :only => :index
  resources :presentations, :only => [:edit, :update]
  namespace :admin do
    resources :events, :only => [:index, :create, :destroy] do
      member do
        put :tasks
      end
    end
    resources :presentations, :only => [:edit, :update, :destroy]
  end
  get '/admin' => 'admin/events#index'
  get '/auth/github/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  root :to => 'welcomes#show'
end
