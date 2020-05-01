require "sinatra"
require "./lib/birthdate"

class Birthday < Sinatra::Base
  get "/" do
    erb(:index)
  end

  post "/message" do
    @name = params[:name]
    @date = Birthdate.new(params[:date], Date.today)
    erb(:message)
  end

  run! if app_file == $0
end
