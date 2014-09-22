require "addressable/uri"
require "curb"
require "crack/xml"
require "nokogiri"

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
    attr_accessor :page
    
    # Runs the search based on the instance vars
    def perform
      raise ArgumentError, "Need phrase to perform search" unless @phrase
      uri = Addressable::URI.parse(FT.conf[:url])
      uri.query_values = {
        key: FT.conf[:key],
        phrase: @phrase,
        extension: ( @ext ? @ext : nil ),
        page: ( @page ? @page : nil )
      }

      http = Curl.get(uri.to_s)
      
      Crack::XML.parse(http.body_str)
    end
    # Get direct links to hosting sites in form of an Array from the FilesTube search result pages
    def prune_links
      links = []
      result = self.perform
      ft_links = result.ft_links
      ft_links.each do |ft_link|
        http = Curl.get(ft_link)
        doc = Nokogiri::HTML(http.body_str)
        link = doc.xpath('//*[@id="copy_paste_links"]').children.first.to_s.chomp
        links.push link if link.empty? == false
      end
      links
    end
    # Get links to FilesTube search result pages in form of an Array
    def links
      links = []
      result = self.perform
      links = result.ft_links
    end
  end
end

class Hash
  # Make a trip through a Hash iterating through "hits" nested Hash and return values of "links" in form of Array
  def ft_links
    begin
      ft_links = []
      hits = self["answer"]["results"]["hits"]
      hits.each do |hit|
        ft_links.push hit["link"]
      end
      ft_links
    rescue NoMethodError
      return []
    end
  end
end