# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get 'student/list'
  get 'student/new'
  post 'student/create'
  patch 'student/update'
  get 'student/show'
  get 'student/edit'
  get 'student/destroy'
  get 'grades/new'
  post 'grades/create'
  get 'grades/destroy'
  resources :student, :grades
  root to: 'home#index'
end
