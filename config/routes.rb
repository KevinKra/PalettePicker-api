Rails.application.routes.draw do
  resources :users do
    resources :projects do
      resources :palettes
    end
  end
end
