class MapsController < ApplicationController
  before_filter :authenticate_user!, only: [:show, :index, :destroy]
  skip_before_filter :verify_authenticity_token
  expose(:map)

  # GET /maps
  # GET /maps.json
  def index
    @maps = Map.all
  end

  # GET /maps/1
  # GET /maps/1.json
  def show
  end

  # DELETE /maps/1
  # DELETE /maps/1.json
  def destroy
    map.destroy
    respond_to do |format|
      format.html { redirect_to maps_url }
      format.json { head :no_content }
    end
  end

  def create_rasberrypi
    unless params[:key] == "kurczak"
      render json: { success: false, message: "brak autoryzacji" }, status: 422
    else
      @map = Map.new(name: params[:name], content: params[:content])
      if @map.save
        render json: { success: true, message: "utworzono mape storny" }, status: 422
      else
        render json: { success: false, message: @map.errors }, status: 422
      end
    end
  end
end
