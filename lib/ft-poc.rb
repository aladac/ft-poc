require "addressable/uri"
require "curb"
require "crack/xml"

module FT
  # returns the root directiory of the gem
  def self.root
    File.dirname __dir__
  end
  
  # holds the "static" data used to connect to the FilesTube API endpoint
  def self.conf
    {
      url: "http://api.filestube.com",
      key: "d395980ed3bb71cfbcbf845ea4a18928"      
    }
  end
  
  # Class containing search define and perform
  class Search
    # The phrase we are looking for
    attr_accessor :phrase
    # The extension of the file(s) we are looking for with :phrase
    attr_accessor :ext
    
    # Runs the search based on the instance vars
    def perform
      raise ArgumentError, "Need phrase to perform search" unless @phrase
      uri = Addressable::URI.parse(FT.conf[:url])
      uri.query_values = {
        key: FT.conf[:key],
        phrase: @phrase,
        extension: ( @ext ? @ext : nil )
      }

      http = Curl.get(uri.to_s)
      
      result = Crack::XML.parse(http.body_str)
    end
  end
end