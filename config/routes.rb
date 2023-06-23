Rails.application.routes.draw do
  # 会員用
  devise_for :members, skip: [:passwords],controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  devise_for :admins, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }

  # フロント
  root to: "public/homes#top"
  # get "public/post_events/:post_event_id/favorites"=>"public/favorites#destroy", as: 'destroy_favorite'
  # get "public/post_events/:post_event_id/favorites"=>"public/favorites#create", as: 'post_favorite'
  get "homes/about"=>"public/homes#about", as: 'about'

  namespace :public do
    resources :members, only: [:index, :show, :edit, :update]
    resources :post_events, only: [:show, :index, :new, :edit, :create, :update, :destroy]do
      resource :favorites, only: [:create, :destroy]
    end
  end


  # 管理者
  namespace :admin do
    root to: "homes#top"
    resources :members, only: [:index, :show]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :places, only: [:edit, :create, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
