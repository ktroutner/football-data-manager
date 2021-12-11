# frozen_string_literal: true

# Value object for country
class Country
  attr_reader :country

  VALUES = { japan: 81 }.freeze

  def initialize(country)
    @country = country
  end
end
