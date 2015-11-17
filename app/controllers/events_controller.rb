class EventsController < ApplicationController
  require "rest-client"
  require "json"

  def about
  end

  def profile
  end

  def index
    @event = Event.new
    @random_quote = ["Let's plan for the night of your life!", "Weekend is too short to do nothing!", "Monday is coming! Let's do something!"][rand(3)]
    @instruction = "We recommend events around your neighborhood!"
  end

  def create
  	@event = Event.new(event_params)
    if @event.save
  		redirect_to event_path(@event), notice: "We are looking for cool stuff around your hood!"
    else
  		render :new
    end
  end

  def show
  	@event = Event.find(params[:id])
    eventful_api_key=ENV['EVENTFUL_API_KEY']
		location = @event.location
    if location == "LA"
      location = "Los Angeles"  
    end
    location = location.gsub(' ', '+')

    #URLS

    #comedy, concert, film, museums, outdoors, nightlife, food

		eventful_concert_url = "http://api.eventful.com/json/events/search?app_key=#{eventful_api_key}&date=This+Week&categories=concerts&categories=festivals&within=6&sort_order=popularity&location=#{location}&page_size=5"
		eventful_comedy_url = "http://api.eventful.com/json/events/search?app_key=#{eventful_api_key}&date=This+Week&categories=comedy&within=6&sort_order=popularity&location=#{location}&page_size=5"
    
    if location.include? ("0" or "1" or "2" or "3" or "4" or "5" or "6" or "7" or "8" or "9")
      opentable_city_url = "http://opentable.herokuapp.com/api/restaurants?zip=#{location}&per_page=5"
    else
      opentable_city_url = "http://opentable.herokuapp.com/api/restaurants?city=#{location}&per_page=5"
    end

    #Response Fetch & Converstion

    concert_response = JSON.parse(RestClient.get(eventful_concert_url))
		concert_response = concert_response["events"]["event"]

    comedy_response = JSON.parse(RestClient.get(eventful_comedy_url))
    if comedy_response["total_items"] == "0"
      eventful_comedy_url =  "http://api.eventful.com/json/events/search?app_key=#{eventful_api_key}&date=This+Week&within=20&sort_order=popularity&location=#{location}&page_size=5"
      comedy_response = JSON.parse(RestClient.get(eventful_comedy_url))
    end
    comedy_response = comedy_response["events"]["event"]

    opentable_response = JSON.parse(RestClient.get(opentable_city_url))
    opentable_response = opentable_response["restaurants"] 

    eventful_concert_count = 0
    eventful_comedy_count = 0
    opentable_count = 0

		eventful_concert_output_list = {}
    eventful_concert_output_array = []
		concert_response.each do |event|
      r = concert_response[eventful_concert_count]
      eventful_concert_count += 1
			date = r["start_time"]
      date = "#{date}"
			event_name = r["title"]
			venue_name = r["venue_name"]
			venue_address = "#{r["venue_address"]}, #{r["city_name"]} "
			event_url = r["url"]
      description= r["description"]
			eventful_concert_output_list["date_#{eventful_concert_count}"] = date
      eventful_concert_output_list["event_name_#{eventful_concert_count}"] = event_name
      eventful_concert_output_list["venue_name_#{eventful_concert_count}"] = venue_name
      eventful_concert_output_list["venue_address_#{eventful_concert_count}"] = venue_address
      eventful_concert_output_list["event_url_#{eventful_concert_count}"] = event_url
      eventful_concert_output_list["description_#{eventful_concert_count}"] = description
      eventful_concert_output_array.append(["Event Name: #{event_name}", "Date: #{date}", "Location: #{venue_address} ", "Reservation_URL: #{event_url}", "Description: #{description}"]) 
		end

    eventful_comedy_output_list = {}
    eventful_commedy_output_array = []
    comedy_response.each do |event|
      r = comedy_response[eventful_comedy_count]
      eventful_comedy_count += 1
      date = "#{r["start_time"]}"
      event_name = r["title"]
      venue_name = r["venue_name"]
      venue_address = "#{r["venue_address"]}, #{r["city_name"]} "
      event_url = r["url"]
      description= r["description"]
      eventful_comedy_output_list["date_#{eventful_comedy_count}"] = date
      eventful_comedy_output_list["event_name_#{eventful_comedy_count}"] = event_name
      eventful_comedy_output_list["venue_name_#{eventful_comedy_count}"] = venue_name
      eventful_comedy_output_list["venue_address_#{eventful_comedy_count}"] = venue_address
      eventful_comedy_output_list["event_url_#{eventful_comedy_count}"] = event_url
      eventful_comedy_output_list["description_#{eventful_comedy_count}"] = description
      eventful_commedy_output_array.append(["Event Name: #{event_name}", "Date: #{date}", "Location: #{venue_address}", "Reservation_URL: #{event_url}", "Description: #{description}"]) 
    end

    opentable_output_list = {}
    opentable_output_array = []
    opentable_response.each do |f|
      opentable_count += 1
      restaurant_name = f["name"]
      restaurant_price = f["price"]
      restaurant_address = "#{f["address"]}, #{f["city"]} "
      reservation_url = f["reserve_url"]
      opentable_output_list["dine_#{opentable_count}_name"] = restaurant_name
      opentable_output_list["dine_#{opentable_count}_price"] = restaurant_price
      opentable_output_list["dine_#{opentable_count}_address"] = restaurant_address
      opentable_output_list["dine_#{opentable_count}_url"] = reservation_url
      opentable_output_array.append(["Restaurant Name: #{restaurant_name}", "Price Level (out of 4): #{restaurant_price}", "Location: #{restaurant_address}", "Reservation_URL: #{reservation_url}"]) 
    end

    @eventful_concert_output_array = eventful_concert_output_array
    @eventful_commedy_output_array = eventful_commedy_output_array
    @opentable_output_array = opentable_output_array
    
    Rails.cache.write("eventful_concert_array", eventful_concert_output_array)
    Rails.cache.write("eventful_comedy_array", eventful_commedy_output_array)
    Rails.cache.write("opentable_restaurant_array", opentable_output_array)
		
    @eventful_concert_output = eventful_concert_output_list
    @eventful_comedy_output = eventful_comedy_output_list
    @opentable_output = opentable_output_list
    
    @recommendation = Recommendation.new
  end

  private

  def event_params
  	params.require(:event).permit(:location)
  end


end
