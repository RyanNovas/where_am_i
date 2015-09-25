module NyTimesApi

  def neighborhood_query(location)
    url = "http://api.nytimes.com/svc/politics/v2/districts.json?lat=#{location.latitude}&lng=#{location.longitude}&api-key=#{ENV["Neighborhood_key"]}"
    @response = HTTParty.get(url)
    while @response.code != 200
      @response = HTTParty.get(url)
    end
    neighborhood_information(location)
  end

  def neighborhood_information(location)
      selected_result = @response["results"].select { |value| value["level"].include?("Neighborhood") }
      @neighborhood_name = selected_result.first["district"]
      @borough_name = @response["results"].last["district"]
      Neighborhood.neighborhood_exists?(location, @neighborhood_name, @borough_name)
  end

end
