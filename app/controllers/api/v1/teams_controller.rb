module Api
  module V1
    class TeamsController < ApiController

      api :GET, '/teams', 'Show list of teams'
      formats [:json]
      def index
        @teams = Team.all
        render json: @teams
      end

      api :GET, '/teams/:id', 'Show Team info'
      formats [:json]
      param :id, :number, :required => :true
      def show
        @team = Team.find(params[:id])
        render json: @team, status: :ok
        # if @team.present?
        #   render json: @team, status: :ok
        # else
        #   render json: @team, status: :not_found
        # end

      end

      api :POST, '/teams', 'Create Team'
      formats [:json]
      param :team, Hash, :required => true, :action_aware => true do
        param :name, String, :required => :true, :desc => 'Name of Team'
        param :description, String, :required => :false, :desc => 'Short description of Team'
      end
      def create
        @team = Team.new(team_params)

        if @team.save
          render json: @team, status: :created
        else
          render json: @team.errors, status: :unprocessable_entity
        end
      end

      api :PATCH, '/teams/:id', 'Create Team'
      formats [:json]
      param :id, :number, :required => true
      param :team, Hash, :required => true, :action_aware => true do
        param :name, String, :required => false, :desc => 'Name of Team'
        param :description, String, :required => :false, :desc => 'Short description of Team'
      end
      def update
        @team = Team.find(params[:id])

        if @team.update_attributes(team_params)
          # head :no_content
          render json: @team, status: :accepted
        else
          render json: @team.errors, status: :unprocessable_entity
        end
      end

      api :DELETE, '/teams/:id', 'Destroy an Team'
      def destroy
        @team = Team.find(params[:id])
        @team.destroy
        head :no_content
      end

      def team_params
        params.require(:team).permit(:name, :description)
      end

    end
  end
end

