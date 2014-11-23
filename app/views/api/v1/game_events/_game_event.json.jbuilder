json.(game_event, :id, :game_id, :player_id, :event_code)
json.event_time game_event.event_time.to_s(:timespan)