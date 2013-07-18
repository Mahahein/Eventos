Calendar::Application.routes.draw do
  get "user/index"

  resources :events do
  resources :items
  end  

  resources :customers
  resources :products
  resources :categories
  devise_for :users  

  root to: 'static_pages#home'

  match '/signup', to: 'users#new'
  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  
end
