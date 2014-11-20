module Api
  module V1
    class PlayerTimesController < ApiController

      api :POST, '/player_times', 'Create "player in game" event'
      param :player_time, Hash, :required => true do
        param :game_id, :number, :required => true, :desc => 'ID of the current game'
        param :player_id, :number, :required => true, :desc => 'ID of current player'
        param :in_time, String, :required => true, :desc => 'Time when player come IN game'
        # param :out_time, String, :required => false, :desc => 'Time of game when player get out'
      end
      def create
        @event = PlayerTime.new(player_time_params)
        if @event.save
          render json: @event, status: :created
        else
          render json: @event.errors, status: :unprocessable_entity
        end
      end

      api :PATCH, '/player_times/:id', "Update player time entry and set 'game out' time"
      param :player_time, Hash, :required => true do
        param :out_time, String, :required => true, :desc => 'Time of game when player get out'
      end
      def update
        @event = PlayerTime.find(params[:id])
        if @event.update_attributes(player_time_params)
          # head :no_content
          render json: @event, status: :accepted
        else
          render json: @event.errors, status: :unprocessable_entity
        end
      end

      private

      def player_time_params
        params.require(:player_time).permit(:game_id, :player_id, :in_time, :out_time)
      end

    end
  end
end
