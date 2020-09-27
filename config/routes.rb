Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  


  unauthenticated :user do
    root 'welcome#index', as: :unauthenticated_root
  end

  authenticated :user do
    root 'lists#index', as: :authenticated_root
  end
  
  resources :lists, only: [:index, :new, :create, :show] do
    resources :list_items, only: [:create, :destroy], as: :items do
      delete :complete
    end
    resources :list_shares, only: [:new, :create], as: :shares
  end

  namespace :api do
    namespace :v1 do
      resources :list_items, only: :none do
        post :complete
      end
    end
  end

end
