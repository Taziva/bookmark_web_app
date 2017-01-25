ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'datamapper_setup.rb'

class Bookmarks < Sinatra::Base

  enable :sessions

  get '/' do
    'Hello Bookmarks!'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/add' do
    erb :add
  end

  post '/create' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
