module Api
  module V1
    class StatisticsController < ApiController
      include ActiveModel::Serialization

      api :GET, '/statistics/:game_id/player/:player_id', 'Show statistic for player'
      formats [:json]
      def player
        player = Player.find(params[:player_id])
        @stats = player.stats(params[:game_id])
        response = @stats.merge({ player_id: params[:player_id], game_id: params[:game_id] })
        respond_with response, serializer: PlayerStatsSerializer
      end

      api :GET, '/statistics/:game_id/team/:team_id', 'Show statistics for each player of team'
      formats [:json]
      def team
        team = Team.find(params[:team_id])
        @team_stats = []
        team.players.each do |player|
          stats = player.stats(params[:game_id])
          @team_stats.push stats.merge({player_id: player.id, game_id: params[:game_id]})
        end
        respond_with @team_stats
      end

    end
  end
end
