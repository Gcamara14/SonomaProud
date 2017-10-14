Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  get 'welcome/resources'

  get 'welcome/contact'


  root 'welcome#index'

  resources :businesses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
