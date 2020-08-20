Rails.application.routes.draw do
  scope '/RestAPIFurb' do
    devise_for :usuarios,
               controllers: {
                 sessions: 'sessions',
                 registrations: 'registrations'
               }

    resources :comandas
    resources :produtos
  end
end
