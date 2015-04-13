class GameEventSerializer < ActiveModel::Serializer
  attributes :id, :game_id, :player_id, :event_code, :event_type
end
