module Api
  module V1
    class GameEventsController < ApiController

      api :POST, '/game_events', 'Create "game event"'
      param :game_event, Hash, :required => true do
        param :game_id, :number, :required => true, :desc => 'ID of the current game'
        param :player_id, :number, :required => true, :desc => 'ID of the current player'
        param :event_code, GameEvent.event_codes.keys, :required => true, :desc => 'Event code'
        param :event_time, String, :required => true, :decs => 'Event time'
      end
      def create
        @event = GameEvent.new(game_event_params)
        if @event.save
          respond_with @event, status: :created
        else
          render json: @event.errors, status: :unprocessable_entity
        end
      end

      private

      def game_event_params
        params.require(:game_event).permit(:game_id, :player_id, :event_code, :event_time)
      end

    end
  end
end
