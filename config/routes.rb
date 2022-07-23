# frozen_string_literal: true

Rails.application.routes.draw do
  get 'user_query/index' => 'user_query#index'

  resources :aircraft_models, only: %i[index create]
end
