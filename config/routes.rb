Rails.application.routes.draw do
  # Page d'accueil
  root 'home#index'
  # API routes
  namespace :api do
    get "countries", to: "countries#index"
    get "countries/:id", to: "countries#show"
  end
  
  # Routes pour les pages principales
  root "home#index"
  
  # Routes pour les pages statiques
  get "methodology", to: "pages#methodology"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"
  
  # Routes pour les pays
  resources :countries, only: [:index, :show] do
    resources :embassies, only: [:show] do
      collection do
        post 'contact'
      end
    end
    resources :petitions, only: [:create]
  end
  resources :countries, only: [:index, :show]
  
  # Routes pour les activités
  resources :activities, only: [:index]
  # Route pour contacter les ambassades
  get "countries/:id/contact", to: "embassy#contact", as: :embassy_contact
  post "countries/:id/contact", to: "embassy#send_message"
  
  # Pages statiques
  get '/about-methodology', to: 'pages#methodology'
  get '/not-found', to: 'pages#not_found'
  # Route pour les actions (pétitions, etc.)
  resources :petitions, only: [:create]
  
  # Catch-all route for 404s
  match '*unmatched', to: 'application#not_found', via: :all, constraints: lambda { |req| req.path.exclude? 'rails/active_storage' }
end