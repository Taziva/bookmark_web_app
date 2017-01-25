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
    tag = Tag.first_or_create(name: params[:tags].gsub(' ', '_').downcase)
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/tags' do
    @tags = Tag.all
    puts @tags[0].name
    erb :tags
  end

  post '/selection' do
    session[:tag] = params[:filtered_tag]
    redirect '/filter'
  end

  get '/filter' do
    puts "*************", session[:tag]
    @tag = Tag.first(name: session[:tag])
    puts "-------------", @tag
    @links = Link.get(@tag.name)
    erb :links
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
