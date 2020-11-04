Rails.application.routes.draw do
 
  devise_for :users
  # ,controllers: {
  #   registrations: 'users/registrations',
  #   sessions: 'users/sessions'
  # }

  # devise_scope :user do
  #   get 'sending_destinations', to: 'users/registrations#newSendingDestination'
  #   post 'sending_destinations', to: 'users/registrations#createSendingDestination'
  # end
  root 'items#index'
  resources :items, only: [:index, :new, :create, :destroy, :edit, :update, :show]

end

