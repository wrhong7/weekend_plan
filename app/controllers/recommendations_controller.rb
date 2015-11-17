class RecommendationsController < ApplicationController
  def index
    # @map = Map.where(:recommendation_id => params[:id])
    # @map.each do |map|
    #   @hash = Gmaps4rails.build_markers(@map) do |map, marker|
    #     marker.lat map.latitude
    #     marker.lng map.longitude
    #     marker.infowindow map.title
    #   end
    # end
  end

  def new
  end

  def show
    @recommendation = Recommendation.find(params[:id])
  end


  def create
  	@recommendation = Recommendation.create(recommendation_params)
  	if @recommendation.save
  		redirect_to recommendation_path(@recommendation), notice: "Here are the recommendations for you"
  	else
  		render :new
  	end
  end

	private

	def recommendation_params
    params.require(:recommendation).permit(:event_1_check_box, :event_1_name, :event_1_location, :event_1_address, :event_1_url, :event_1_desc, :event_2_check_box, :event_2_name, :event_2_location, :event_2_address, :event_2_url, :event_2_desc, :event_3_check_box, :event_3_name, :event_3_location, :event_3_address, :event_3_url, :event_3_desc, :event_4_check_box, :event_4_name, :event_4_location, :event_4_address, :event_4_url, :event_4_desc, :event_5_check_box, :event_5_name, :event_5_location, :event_5_address, :event_5_url, :event_5_desc, :event_6_check_box, :event_6_name, :event_6_location, :event_6_address, :event_6_url, :event_6_desc, :event_7_check_box, :event_7_name, :event_7_location, :event_7_address, :event_7_url, :event_7_desc, :event_8_check_box, :event_8_name, :event_8_location, :event_8_address, :event_8_url, :event_8_desc, :event_9_check_box, :event_9_name, :event_9_location, :event_9_address, :event_9_url, :event_9_desc, :event_10_check_box, :event_10_name, :event_10_location, :event_10_address, :event_10_url, :event_10_desc, :dine_1_name, :dine_1_check_box, :dine_1_price, :dine_1_address, :dine_1_url, :dine_2_check_box, :dine_2_name, :dine_2_price, :dine_2_address, :dine_2_url, :dine_3_check_box, :dine_3_name, :dine_3_price, :dine_3_address, :dine_3_url, :dine_4_check_box, :dine_4_name, :dine_4_price, :dine_4_address, :dine_4_url, :dine_5_check_box, :dine_5_name, :dine_5_price, :dine_5_address, :dine_5_url)
  end

end