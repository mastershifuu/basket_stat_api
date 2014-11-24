json.array! @team_stats do |player|
  json.id player[:id]
  json.number player[:number]
  json.full_name player[:full_name]
  json.game_statistics do
    json.partial! 'player_stats', stats: player[:stats]
  end
end