require 'yelp'
module YelpApi

  def yelp_client
    Yelp::Client.new({ consumer_key: ENV["consumer_key"],
                                consumer_secret: ENV["consumer_secret"],
                                token: ENV["token"],
                                token_secret: ENV["token_secret"]
                              })
    end


    def yelp_attributes(lat, lon, type)
      coordinates = { latitude: lat, longitude: lon }
      params = { term: type,
         limit: 1,
         sort: 2,
         category_filter: type,
         radius_filter: 250
       }

      results = yelp_client.search_by_coordinates(coordinates, params)
      @restaurant_url = results.businesses[0].url
      # @restaurant_name = restaurant.businesses[0].name
    end

end
