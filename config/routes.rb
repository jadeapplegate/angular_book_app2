Rails.application.routes.draw do

  root 'pages#index'
  resources :books, except: [:new, :edit]

end

