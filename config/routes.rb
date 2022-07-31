# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :version1 do
      get 'user_query/index' => 'user_query#index'
    end
  end

  resources :aircraft_models, only: %i[index create update destroy]
end
