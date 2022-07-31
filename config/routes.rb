# frozen_string_literal: true

Rails.application.routes.draw do
  get 'ratings/create'
  get 'ratings/update'
  get 'ratings/destroy'
  get 'user_query/index' => 'user_query#index'

  resources :aircraft_models, only: %i[index create update destroy]
end
