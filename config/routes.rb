Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  authenticated :user do 
    root 'lists#index', as: :authenticated_root
    
    resources :lists, only: [:index, :new, :create, :show] do
      member do
        resources :list_items, only: [:create]
      end
    end
  end

  unauthenticated :user do
    root 'welcome#index', as: :unauthenticated_root
  end
end
