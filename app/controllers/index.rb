get '/' do
  erb :index
end

post '/' do
  p 'i am here'
  client = Yelp::Client.new
  request = Yelp::V1::Review::Request::Location.new(params[:search])
  response = client.search(request)
  @businesses = response['businesses']
  erb :_biz_search, layout: false
end

get '/id/:id' do
  client = Yelp::Client.new
  request = Yelp::V2::Business::Request::Id.new(
            :yelp_business_id => params[:id],
            :consumer_key => ENV['CONSUMER_KEY'],
            :consumer_secret => ENV['CONSUMER_SECRET'],
            :token => ENV['TOKEN'],
            :token_secret => ENV['TOKEN_SECRET'])
  @business = client.search(request)
  erb :business
end

get '/category/:category' do
  client = Yelp::Client.new
  request = Yelp::V1::Review::Request::Location.new(
             :city => 'San Francisco',
             :state => 'CA',
             :category => params[:category],
             :yws_id => ENV['YWSID'])
  response = client.search(request)
  @businesses = response['businesses']
  erb :category
end

