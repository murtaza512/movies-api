# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'api/movies#index'

  namespace :api do
    namespace :v1 do
      resources :movies, only: %i[index show]
    end
  end
end
