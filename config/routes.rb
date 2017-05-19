Rails.application.routes.draw do
  resources :comments
  devise_for :users

  get 'welcome/index'


  	resources :articles do
  		resources :comments, only:[:destory,:create,:update,:new,:show] 
  	end

	root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  

end
