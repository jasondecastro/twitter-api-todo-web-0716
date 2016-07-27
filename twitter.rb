require 'twitter'
require 'yaml'
require 'pry'

class TwitterApi
  attr_reader :client

  def initialize
    keys = YAML.load_file('application.yml')
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = keys['CONSUMER_KEY']
      config.consumer_secret     = keys['CONSUMER_SECRET']
      config.access_token        = keys['ACCESS_TOKEN']
      config.access_token_secret = keys['ACCESS_TOKEN_SECRET']
    end
  end


  def most_recent_friend(username)
    #find the twitter gem method that retrieves a user's friends and grab the most recent friend
    client.friends(username).attrs[:users][0][:screen_name]
  end

  def find_user_for(username)
    #find the twitter gem method that returns the correct user, given a username
    client.user(username).attrs[:name]
  end

  def find_followers_for(username)
    #find the twitter gem method that returns the follows of a given user
    counter = 0
    result = client.followers(username)
    followers = []
    20.times do 
      followers << result.attrs[:users][counter][:screen_name]
      counter += 1
    end
    followers
  end

  def homepage_timeline(username)
    #find the twitter gem method that retreives the tweets from a user's timeline.
    tweets = []
    client.user_timeline(username).each do |x|
      tweets << x.text
    end
    tweets.each {|x| puts x + "\n\n\n"}
  end

  def trump(username)
    #find the twitter gem method that retreives the tweets from a user's timeline.
    tweets = []
    client.user_timeline(username).each do |x|
      tweets << x.text
    end
    
  end
  
end

#Bonus: 
# uncomment out the following and read the bonus instructions.
# remember to comment out the WebMock line of your spec_helper, as the instructions dictate.

tweet_client = TwitterApi.new
puts "Below is the first method\n"
puts "-" * 40
puts tweet_client.most_recent_friend("realdonaldtrump")
puts ""
puts ""
puts "Below is the second method\n"
puts "-" * 40
puts tweet_client.find_user_for("realdonaldtrump")
puts ""
puts ""
puts "Below is the third method\n"
puts "-" * 40
puts tweet_client.find_followers_for("realdonaldtrump")
puts ""
puts ""
puts "Below is the fourth method\n"
puts "-" * 40
puts tweet_client.homepage_timeline("realdonaldtrump")

