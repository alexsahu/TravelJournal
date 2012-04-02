class Place < ActiveRecord::Base

  require 'oauth'
  require 'yelpster'
  
  has_many :reviews , :dependent => :destroy
  
  before_save :load_yelp_attributes
  
  accepts_nested_attributes_for :reviews , :allow_destroy => true
  
  #loading yelp related attributes before we save 
  def load_yelp_attributes 
    client = Yelp::Client.new
    search = Yelp::V2::Search::Request::Location.new(
    :term => name, 
    :city => city,
    :country => nation,
    :category => ["lounges"], 
    :limit => 1,
    :consumer_key => YelpConfig["yelp_config"]["consKey"], 
    :consumer_secret => YelpConfig["yelp_config"]["consSecret"], 
    :token => YelpConfig["yelp_config"]["token"], 
    :token_secret => YelpConfig["yelp_config"]["tokenSecret"])
    response = client.search(search);
    # self.yelp_rating = response['businesses'][0]['rating']
    # self.yelp_review = response['businesses'][0]['snippet_text']
    self.phone_number = response['businesses'][0]['display_phone']
    #cats = response['businesses'][0]['categories']
    self.display_address = response['businesses'][0]['location']['display_address'].join("<br/>")
    self.latitude = response['businesses'][0]['location']['coordinate']["latitude"]
    self.longitude =  response['businesses'][0]['location']['coordinate']["longitude"]
  end
end
