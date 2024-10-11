Rails.application.routes.draw do
  resources :productos
  resources :clientes
  resources :pedidos
  
  root "productos#index"
end

