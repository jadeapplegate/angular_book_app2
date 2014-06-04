Rails.application.routes.draw do

  resources :books, except: [:new, :edit]

end

