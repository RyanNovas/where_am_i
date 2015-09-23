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
      if results.businesses.empty?
        establishment_not_found(type)
      else
        results.businesses[0].raw_data
      end
    end

    def establishment_not_found(type)
      { "name" => "There are no #{type}",
        "url" => "#",
        "location" => {"coordinate" => { "latitude" => "", "longitude" => "" }}
      }
    end

end
