Rails.application.routes.draw do
  resources :departamentos
  root 'produtos#index'
  post 'produtos/busca', to: 'produtos#busca', as: :busca_produtos
  resources :produtos
end
