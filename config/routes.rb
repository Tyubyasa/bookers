Rails.application.routes.draw do
  root to: 'homes#top'
  # get 'books/index'
  # .../books/1 や .../books/3 に該当する
  # get 'books/:id' => 'books#show'
  resources :books
  # get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'

  end