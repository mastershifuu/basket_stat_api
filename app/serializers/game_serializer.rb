class GameSerializer < ActiveModel::Serializer
  attributes :id, :away_team_id, :home_team_id, :date,
             :started_at, :finished_at
end
