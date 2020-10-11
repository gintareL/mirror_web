Rails.application.routes.draw do
  resources :words do
  end
  #get 'words', to: 'words#index', as: 'words'
  #get 'word/:id', to: 'words#edit', as: 'edit_word'
  #get 'words/update'
  #get 'words/new'
  #get 'words/create'
  root 'mirror#index'
end
