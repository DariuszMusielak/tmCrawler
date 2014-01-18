class MapsController < ApplicationController
  before_filter :authenticate_user!, only: [:show, :index, :destroy]
  before_filter :check_premissions, only: [:create_rasberrypi, :get_pending]

  skip_before_filter :verify_authenticity_token
  expose(:map)

  # GET /maps
  # GET /maps.json
  def index
    @maps = Map.all
  end

  def new
    map = Map.new
  end


  def create
    map.user_id = current_user.id
    if map.save
      redirect_to maps_path
    else
      render :new
    end
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
      format.html { redirect_to request.referer }
      format.json { head :no_content }
    end
  end

  def update_map
    if @map = Map.find_by_id(params[:id])
      if @map.update_attributes(content: params[:content], status: "gotowy")
        render json: { success: true, message: "Mapa strony została poprawnie zaktualizowana" }, status: 422
      else
        render json: { success: false, message: @map.errors }, status: 422
      end
    else
      render json: { success: false, message: "Brak mapy o takim id #{params[:id]}" }, status: 422
    end
  end

  def get_pending
    if @map = Map.status_created.first
      if @map.update_attributes(status: "wyslany")
        render json: { success: true, message: { id: @map.id, url: @map.url } }, status: 422
      else
        render json: { success: false, message: @map.errors }, status: 422
      end
    else
      render json: { success: false, message: "Brak oczekujących stron do zmapowania" }, status: 422
    end
  end

  protected

  def check_premissions
    unless params[:key] == "kurczak"
      render json: { success: false, message: "brak autoryzacji" }, status: 422
    end
  end
end
