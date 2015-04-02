class GameEvent < ActiveRecord::Base
  belongs_to :game
  belongs_to :player

  enum event_code: {
    ftm: 1,
    fta: 2,
    fgm: 3,
    fga: 4,
    fgm3: 5,
    fga3: 6,
    ast: 7,
    blk: 8,
    orb: 9,
    drb: 10,
    los: 11,
    stl: 12,
    pf: 13,
    pfc: 14
  }

  validates :event_code, :event_time, :game_id, :player_id, presence: true
end
