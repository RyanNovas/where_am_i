module CraigslistScraper
  def search_craiglist(query_string)
    state = 'something_state'
    neighborhood = 'something_neighborhood'
    doc = Nokogiri::HTML(open("https://newyork.craigslist.org/search/aap?query=ridgewood&availabilityMode=0&sale_date=all+dates"))
  end
end
