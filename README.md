### General
Simple HTTP API bindings and example command line script for the FilesTube API.

### Example Usage
```ruby
search = FT::Search.new
search.phrase = "blabla"
search.prune_links
=> ["https://mega.co.nz/#!rd8A0AxT!372QJ5BdA6maLRM8zNdstKKirVlRAQZwbI5OG82yYtc",
 "http://soundcloud.com/lauris21/blabla",
 "http://filenuke.com/35q5j9ngvwsh",
 "http://www.firedrive.com/file/A289BF58C29C5BC5",
 "http://soundcloud.com/0x25ec/naptermeszeteu-blabla-part-3/download",
 "http://www.mediafire.com/file/h2lq5zzkzdm/Bulgarianblabla.zip",
 "http://soundcloud.com/fahren-high-aka-f-h/khallinamnlblabla/download",
 "http://soundcloud.com/dalingo-lingo/take-a-bow-blabla-cover/download",
 "http://www.4shared.com/mp3/onAj2lJU/blabla.htm?aff=7637829"]

```

### Gemfile
```ruby
ruby '2.1.1'

gem 'crack'
gem 'curb'
gem 'addressable'
gem 'nokogiri'

group :development do
  gem 'pry'
  gem 'sdoc'
  gem 'rspec'
end
```