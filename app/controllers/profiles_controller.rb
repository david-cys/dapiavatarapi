class ProfilesController < ApplicationController
  def index
    if params.has_key?(:query)
      @profiles = Profile.search(params[:query])
    else
      @profiles = Profile.all
    end
    render json: @profiles, root: "data"
  end

  def show
    begin
      @profile = Profile.find(params[:id])
      render json: @profile, root: "data"
    rescue ActiveRecord::StatementInvalid
      render_404
    rescue ActiveRecord::RecordNotFound
      render_404
    end
  end
end

