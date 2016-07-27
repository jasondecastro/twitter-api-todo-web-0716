require 'twitter'
require 'yaml'
require 'pry'

class TwitterApi
  attr_reader :client

  def initialize
    keys = YAML.load_file('application.yml')
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = 'Ghg3pT5gBZE1fjeqLSsP25gpm'
      config.consumer_secret     = 'DcR52tLSYkN2JaCwylJUSp8mYd8pX3iz7qoDr0JtxFG7t6Cfdz'
      config.access_token        = '2349407635-o1PpngbxrjS4vGyV9w3X1VbqBkhXYaCDuOAJLkn'
      config.access_token_secret = 'v01SAlsURNAvlKj16t8ywlBPFCb6KfAhQKscq7gdoHBGI'
    end
  end

  def most_recent_friend
    #find the twitter gem method that retrieves a user's friends and grab the most recent friend
    client.friends.first
  end

  def find_user_for(username)
    #find the twitter gem method that returns the correct user, given a username
  
    client.user(username)
  end

  def find_followers_for(username)
    #find the twitter gem method that returns the follows of a given user
    client.followers(username).take(10)

  end

  def homepage_timeline
    #find the twitter gem method that retreives the tweets from a user's timeline.
    client.home_timeline.entries
  end

  # def trump(username)
  #   #find the twitter gem method that retreives the tweets from a user's timeline.
  #   tweets = []
  #   client.user_timeline(username).each do |x|
  #     tweets << x.text
  #   end
    
  # end
  
end

tweet_client = TwitterApi.new
tweet_client.find_followers_for('kanyewest')
#Bonus: 
# uncomment out the following and read the bonus instructions.
# remember to comment out the WebMock line of your spec_helper, as the instructions dictate.

# tweet_client = TwitterApi.new
# username = "kanyewest"
# puts "Below is the first method\n"
# puts "-" * 40
# puts tweet_client.most_recent_friend(username)
# puts ""
# puts ""
# puts "Below is the second method\n"
# puts "-" * 40
# puts tweet_client.find_user_for(username)
# puts ""
# puts ""
# puts "Below is the third method\n"
# puts "-" * 40
# puts tweet_client.find_followers_for(username)
# puts ""
# puts ""
# puts "Below is the fourth method\n"
# puts "-" * 40
# puts tweet_client.homepage_timeline(username)
