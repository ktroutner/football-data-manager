# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get 'home', to: 'home#index', as: :home
  get 'competition_series', to: 'competition_series#index', as: :competition_series_list
  get 'competition_series/:id', to: 'competition_series#show', as: :competition_series
  get 'competitions/:id', to: 'competitions#show', as: :competition
  get 'fixtures/:id', to: 'fixtures#show', as: :fixture
  get 'matches/:id', to: 'matches#show', as: :match
  get 'matches/:id/edit', to: 'matches#edit', as: :edit_match
  patch 'matches/:id', to: 'matches#update', as: :update_match
end
