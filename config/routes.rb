Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  devise_for :users
  # ,controllers: {
  #   registrations: 'users/registrations',
  #   sessions: 'users/sessions'
  # }

  # devise_scope :user do
  #   get 'sending_destinations', to: 'users/registrations#newSendingDestination'
  #   post 'sending_destinations', to: 'users/registrations#createSendingDestination'
  # end
  root "items#index"
  resources :categories, only: [:index, :show] 

  resources :items do
    collection do
      get 'get_category_child', to: 'items#get_category_child', defaults: { format: 'json' }
      get 'get_category_grandchild', to: 'items#get_category_grandchild', defaults: { format: 'json' }
    end
  end
end

