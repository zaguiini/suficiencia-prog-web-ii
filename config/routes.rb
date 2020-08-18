Rails.application.routes.draw do
  scope '/RestAPIFurb' do
    resources :comandas
    resources :produtos
    resources :usuarios
  end
end
