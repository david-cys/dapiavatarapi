class AvatarsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @avatar = Avatar.new(avatar_params)
    if @avatar.save
      render json: @avatar, root: "data"
    else
      render text: "Bad request", status: 400
    end
  end

  def show
    begin
      if params.has_key?("profile_uuid")
        @avatar = Avatar.find_by(profile_uuid: params["profile_uuid"])
      else
        @avatar = Avatar.find(params[:id])
      end
      render json: @avatar, root: "data"
    rescue ActiveRecord::StatementInvalid
      render_404
    rescue ActiveRecord::RecordNotFound
      render_404
    end
  end

  def show_latest
    begin
      @avatar = Avatar.order(created_at: :desc).
        find_by(profile_uuid: params[:profile_uuid])
      raise ActiveRecord::RecordNotFound if @avatar.nil?
      render json: @avatar, root: "data"
    rescue ActiveRecord::StatementInvalid
      render_404
    rescue ActiveRecord::RecordNotFound
      render_404
    end
  end

  private
  def avatar_params
    params.require(:avatar).permit(:image, :profile_uuid)
  end
end
