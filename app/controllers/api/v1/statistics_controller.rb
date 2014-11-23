module Api
  module V1
    class StatisticsController < ApiController

      api :GET, '/statistics/game/:game_id/player/:player_id', 'Show statistic for player'
      formats [:json]
      def player
        player = Player.find(params[:player_id])
        @stats = player.stats(params[:game_id])
        respond_with @stats
      end

      api :GET, '/statistics/game/:game_id/team/:team_id', 'Show statistics for each player of team'
      def team

      end

    end
  end
end