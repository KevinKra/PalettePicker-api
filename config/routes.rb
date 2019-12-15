Rails.application.routes.draw do
  resources :users do
    resources :projects do
      resources :palettes do
        resources :colors
      end
    end
  end
end
