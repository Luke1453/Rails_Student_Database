Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'student#list'

  get 'student/list'
  get 'student/new'
  post 'student/create'
  patch 'student/update'
  get 'student/list'
  get 'student/show'
  get 'student/edit'
  get 'student/delete'
  get 'student/update'
end
