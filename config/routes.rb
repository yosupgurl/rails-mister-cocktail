Rails.application.routes.draw do
  resources :cocktails, only: [:show, :index, :new, :create, :destroy] do
   resources :doses, only: [:create, :new, :index, :destroy]
  end
  root to: "cocktails#index"
  delete 'doses/:id', to: "doses#destroy", as: :destroy_dose
  delete 'cocktails/:id', to: "cocktails#destroy", as: :destroy_cocktail
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


