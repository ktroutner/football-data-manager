# frozen_string_literal: true

# Value object for staff position
class StaffPosition
  attr_reader :position

  VALUES = {
    head_coach: 1,
    coach: 2,
    goalkeeper_coach: 3,
    doctor: 4,
    trainer: 5,
    manager: 6,
    interpreter: 7,
    equipment_manager: 8,
    nutritionist: 9
  }.freeze

  def initialize(position)
    @position = position
  end
end
