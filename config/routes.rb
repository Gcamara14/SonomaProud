Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  get 'welcome/resources'

  get 'welcome/contact'

  get 'welcome/feedback'
  get 'welcome/how'
  get 'welcome/why'


  root to: 'welcome#index'


  resources :businesses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
