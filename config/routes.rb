Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  scope 'api' do
    scope 'v1' do
      resources :quizes, only: %i( index create show destroy )
      resources :questions, only: %i( index create show update destroy )
      resources :results, only: %i( index create show update destroy )
    end
  end
  
end
