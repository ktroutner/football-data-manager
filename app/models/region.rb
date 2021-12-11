# frozen_string_literal: true

# Value object for region
class Region
  attr_reader :region

  VALUES = { asia: 1 }.freeze

  def initialize(region)
    @region = region
  end
end
