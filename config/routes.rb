Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :stories
  root to: 'home#index'

  get 'home/admin_panel', 'home/admin_panel'
  get 'home/make_admin', 'home/make_admin' 
  get 'home/remove_admin', 'home/remove_admin'

  devise_scope :user do 
    get 'users/registrations/show' => 'users/registrations/show'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
