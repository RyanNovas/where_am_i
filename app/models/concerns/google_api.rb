module GoogleApi

  def neighborhood_query(location)
    url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=#{location.latitude},#{location.longitude}&key=#{ENV["Geocoding_key"]}"
    #url = "http://api.nytimes.com/svc/politics/v2/districts.json?lat=#{location.latitude}&lng=#{location.longitude}&api-key=#{ENV["Geocoding_key"]}"
    @response = HTTParty.get(url)
    while @response.code != 200
      @response = HTTParty.get(url)
    end
    neighborhood_information(location)
  end

  def neighborhood_information(location)
      @neighborhood_name = @response["results"][1]["address_components"][0]["long_name"]
      @borough_name = @response["results"][1]["address_components"][1]["long_name"]
      Neighborhood.neighborhood_exists?(location, @neighborhood_name, @borough_name)
  end

end
