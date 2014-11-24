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
      formats [:json]
      def team
        team = Team.find(params[:team_id])
        @team_stats = []
        team.players.each do |player|
          player_info = {
              id: player.id,
              number: player.number,
              full_name: player.full_name,
              stats: player.stats(params[:game_id])
          }
          @team_stats.push player_info
        end
        respond_with @team_stats
      end

    end
  end
end
