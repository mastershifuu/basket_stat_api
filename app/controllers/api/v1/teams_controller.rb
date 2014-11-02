module Api
  module V1
    class TeamsController < ApplicationController
      respond_to :json

      def index
        @teams = Team.all
        respond_with @teams
      end

      def new
      end

      def create
      end

      def edit
      end

      def update
      end

    end
  end
end

