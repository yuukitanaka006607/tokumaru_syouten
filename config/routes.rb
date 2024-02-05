Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

root to: "public/homes#top"
scope module: :public do
  get "customers/my_page" => "customers#show"
  get "customers/information/edit" => "customers#edit"
  patch "customers/information" => "customers#update"
  get "customers/check" => "customers#check"
  patch "customers/withdrawal" => "customers#withdrawal"
end

  namespace :admin do
    get "genres" => "genres#index"
    resources :genres, only: [:new, :create, :show, :edit, :update]
    get "/" => "homes#top"
    get "items" => "items#index"
    resources :items, only: [:new, :show,:create, :edit, :update]
  end

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
