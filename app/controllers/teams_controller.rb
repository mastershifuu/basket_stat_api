class TeamsController < ApplicationController
  
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
