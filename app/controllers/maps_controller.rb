class MapsController < ApplicationController
  def index
  end

  def show
    # @maps = Map.where(:recommendation_id => 87)
    @map = Map.find(params[:id])
		# @hash = Gmaps4rails.build_markers(@map) do |map, marker|
		#   marker.lat map.latitude
		#   marker.lng map.longitude
		#   marker.infowindow map.title
		# end
	end

  def create
  	@map = Map.create(map_params)
  	if @map.save
  		redirect_to map_path(@map), notice: "Here is the custom generated map for you"
  	else
  		render :new
  	end
  end

  private

	def map_params
    params.require(:map).permit(:latitude, :longitude, :address, :title, :recommendation_id)
  end
end
