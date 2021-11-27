# frozen_string_literal: true

# Basic record for application
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
