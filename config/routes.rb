# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get 'home', to: 'home#index', as: :home
  get 'competitions', to: 'competitions#index', as: :competitions
  get 'competitions/:id', to: 'competitions#show', as: :competition
  get 'seasons/:id', to: 'seasons#show', as: :season
  get 'fixtures/:id', to: 'fixtures#show', as: :fixture
  get 'matches/:id', to: 'matches#show', as: :match
  get 'matches/:id/edit', to: 'matches#edit', as: :edit_match
  patch 'matches/:id', to: 'matches#update', as: :update_match
end
