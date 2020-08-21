Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  scope '/RestAPIFurb' do
    devise_for :usuarios,
               controllers: {
                 sessions: 'sessions',
                 registrations: 'registrations'
               }

    resources :comandas
    resources :produtos
    resources :usuarios, only: %i[index show]
  end
end
