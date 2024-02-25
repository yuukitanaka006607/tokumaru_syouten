Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
devise_scope :customer do
  post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  get 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
 end
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
root to: "public/homes#top"
  get "homes/about" => "public/homes#about"
scope module: :public do
  get "customers/my_page" => "customers#show"
  get "customers/information/edit" => "customers#edit"
  patch "customers/information" => "customers#update"
  get "customers/check" => "customers#check"
  patch "customers/withdrawal" => "customers#withdrawal"
  resources :items, only: [:show]
  resources :cart_items, only: [:index, :create, :update, :destroy] do
    collection do
      delete 'destroy_all'
    end
  end
  post "orders/confirm" => "orders#confirm"
  get "orders/complete" => "orders#complete"
  resources :orders, only: [:new, :create, :index, :show]
 end

  namespace :admin do
    get "genres" => "genres#index"
    resources :genres, only: [:new, :create, :show, :edit, :update]
    get "/" => "homes#top"
    get "items" => "items#index"
    resources :items, only: [:new, :show,:create, :edit, :update]
    get "customers/safety" => "customers#safety"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :edit, :update, :delete]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end