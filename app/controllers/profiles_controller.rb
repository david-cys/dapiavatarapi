class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
    render json: @profiles
  end

  def show
    begin
      @profile = Profile.find(params[:id])
      render json: @profile
    rescue ActiveRecord::StatementInvalid
      render_404
    rescue ActiveRecord::RecordNotFound
      render_404
    end
  end
end

