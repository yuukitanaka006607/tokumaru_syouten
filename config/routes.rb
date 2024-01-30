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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
