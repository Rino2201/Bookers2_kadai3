Rails.application.routes.draw do

  devise_for :users

  root to: 'homes#top'

  get "/home/about" => "homes#about", as: "about"

  resources:users,only:[:index,:show,:edit,:update]

  resources:books,only:[:new,:create,:index,:show,:destroy,:edit,:update]

  post "users" => "books#create"
  post "books" => "books#create"
  post "users/:id" => "books#create"
  post "books/:id" => "books#create"

end
