Rails.application.routes.draw do
  devise_for :users
  resources :contacts
  resources :jobs
  resources :infos

  root to: "jobs#index"

	namespace :admin do
		root to: "admin#index"
		resources :infos, :jobs, :contacts
	end
end
