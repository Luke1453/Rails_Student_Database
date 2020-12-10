Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :student

  get 'student/list'
  get 'student/new'
  post 'student/create'
  patch 'student/update'
  get 'student/show'
  get 'student/edit'
  get 'student/destroy'
  root to: 'student#list'
end
