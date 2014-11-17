class Player < ActiveRecord::Base
  belongs_to :team
  enum position: {
      point_guard: 1,
      shooting_guard: 2,
      small_forward: 3,
      power_forward: 4,
      center: 5
  }
end
