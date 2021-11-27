# frozen_string_literal: true

class Fixture < ApplicationRecord
  belongs_to :season
  has_many :matches
end
