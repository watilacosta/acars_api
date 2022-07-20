# frozen_string_literal: true

Rails.application.routes.draw do
  resources :aircraft_models, only: %i[create]
end
