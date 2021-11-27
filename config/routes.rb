# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get 'home', to: 'home#index'
  get 'competitions', to: 'competitions#index'
  get 'competitions/:id', to: 'competitions#show'
  get 'seasons/:id', to: 'seasons#show'
  get 'fixtures/:id', to: 'fixtures#show'
  get 'matches/:id', to: 'matches#show'
end
