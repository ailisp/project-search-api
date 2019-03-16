Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'projects/:search', to: 'projects#show'
  get 'projects', to: 'projects#show'
end
