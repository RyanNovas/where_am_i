module StreetEasyApi
  def avg_one_bdrm
    rentals_end_point = "http://streeteasy.com/nyc/api/rentals/data?criteria=area:#{@location.neighborhood['name']}-#{@location.neighborhood['borough']}%7Cbeds:1&key=#{ENV["StreetEasy_key"]}&format=json"
    get_req = HTTParty.get(rentals_end_point)
    @price = get_req["average_price"]
  end
end