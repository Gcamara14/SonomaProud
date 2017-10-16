Rails.application.routes.draw do
  resources :bizs, :path => 'submit-a-biz'

  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  get 'welcome/resources'

  get 'welcome/contact'

  get 'welcome/feedback'
  get 'welcome/how'
  get 'welcome/why'


  root to: 'businesses#index'


  resources :businesses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
