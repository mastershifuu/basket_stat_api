class GameEvents < ActiveRecord::Base
  belongs_to :game
  belongs_to :player

  EVENT_CODES = []

end
